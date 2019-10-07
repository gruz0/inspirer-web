# frozen_string_literal: true

class AddOneRecordPerDayConstraintsToHealthBodyMeasures < ActiveRecord::Migration[5.2]
  def up
    # Try to find records with non-unique created_at values
    query = <<-SQL
      SELECT COUNT((created_at::text)::date) AS cnt, (created_at::text)::date AS dd
        FROM health_body_measures
        GROUP BY dd
        ORDER BY cnt
        DESC LIMIT 1
    SQL

    result = execute(query)
    if result&.first && result.first['cnt'] > 1
      raise StandardError, "There are #{result.first['cnt']} records with non-unique created_at values found!"
    end

    add_column :health_body_measures, :created_date, :date, default: nil

    execute <<-SQL
      UPDATE health_body_measures SET created_date = (created_at::text)::date;
      ALTER TABLE health_body_measures ALTER COLUMN created_date SET DEFAULT ('now'::text)::date;
      ALTER TABLE health_body_measures ALTER COLUMN created_date SET NOT NULL;
    SQL

    add_index :health_body_measures, %i[account_id created_date], unique: true
  end

  def down
    remove_index :health_body_measures, %i[account_id created_date]
    remove_column :health_body_measures, :created_date
  end
end
