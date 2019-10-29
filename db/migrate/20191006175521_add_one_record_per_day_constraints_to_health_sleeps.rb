# frozen_string_literal: true

class AddOneRecordPerDayConstraintsToHealthSleeps < ActiveRecord::Migration[5.2]
  def up
    # Try to find records with non-unique created_at values
    query = <<-SQL.squish
      SELECT COUNT((created_at::text)::date) AS cnt, (created_at::text)::date AS dd, account_id
        FROM health_sleeps
        GROUP BY dd, account_id
        ORDER BY cnt
        DESC LIMIT 1
    SQL

    result = execute(query)
    if result&.first && result.first['cnt'] > 1
      raise StandardError, "There are #{result.first['cnt']} records with non-unique created_at values found!"
    end

    add_column :health_sleeps, :created_date, :date, default: nil

    execute <<-SQL.squish
      UPDATE health_sleeps SET created_date = (created_at::text)::date;
      ALTER TABLE health_sleeps ALTER COLUMN created_date SET DEFAULT ('now'::text)::date;
      ALTER TABLE health_sleeps ALTER COLUMN created_date SET NOT NULL;
    SQL

    add_index :health_sleeps, %i[account_id created_date], unique: true
  end

  def down
    remove_index :health_sleeps, %i[account_id created_date]
    remove_column :health_sleeps, :created_date
  end
end
