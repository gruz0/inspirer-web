# frozen_string_literal: true

class AddOneRecordPerDayConstraintsToHealthBodyWeights < ActiveRecord::Migration[5.2]
  def up
    # Try to find records with non-unique created_at values
    query = <<-SQL
      SELECT COUNT((created_at::text)::date) AS cnt, (created_at::text)::date AS dd, account_id
        FROM health_body_weights
        GROUP BY dd, account_id
        ORDER BY cnt
        DESC LIMIT 1
    SQL

    result = execute(query)
    if result&.first && result.first['cnt'] > 1
      raise StandardError, "There are #{result.first['cnt']} records with non-unique created_at values found!"
    end

    add_column :health_body_weights, :created_date, :date, default: nil

    execute <<-SQL
      UPDATE health_body_weights SET created_date = (created_at::text)::date;
      ALTER TABLE health_body_weights ALTER COLUMN created_date SET DEFAULT ('now'::text)::date;
      ALTER TABLE health_body_weights ALTER COLUMN created_date SET NOT NULL;
    SQL

    add_index :health_body_weights, %i[account_id created_date], unique: true
  end

  def down
    remove_index :health_body_weights, %i[account_id created_date]
    remove_column :health_body_weights, :created_date
  end
end
