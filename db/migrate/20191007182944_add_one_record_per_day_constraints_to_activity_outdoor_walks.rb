# frozen_string_literal: true

class AddOneRecordPerDayConstraintsToActivityOutdoorWalks < ActiveRecord::Migration[5.2]
  def up
    # Try to find records with non-unique created_at values
    query = <<-SQL.squish
      SELECT COUNT((created_at::text)::date) AS cnt, (created_at::text)::date AS dd, account_id
        FROM activity_outdoor_walks
        GROUP BY dd, account_id
        ORDER BY cnt
        DESC LIMIT 1
    SQL

    result = execute(query)
    if result&.first && result.first['cnt'] > 1
      raise StandardError, "There are #{result.first['cnt']} records with non-unique created_at values found!"
    end

    add_column :activity_outdoor_walks, :created_date, :date, default: nil

    execute <<-SQL.squish
      UPDATE activity_outdoor_walks SET created_date = (created_at::text)::date;
      ALTER TABLE activity_outdoor_walks ALTER COLUMN created_date SET DEFAULT ('now'::text)::date;
      ALTER TABLE activity_outdoor_walks ALTER COLUMN created_date SET NOT NULL;
    SQL

    add_index :activity_outdoor_walks, %i[account_id created_date], unique: true
  end

  def down
    remove_index :activity_outdoor_walks, %i[account_id created_date]
    remove_column :activity_outdoor_walks, :created_date
  end
end
