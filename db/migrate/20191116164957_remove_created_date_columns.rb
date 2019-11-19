# frozen_string_literal: true

class RemoveCreatedDateColumns < ActiveRecord::Migration[6.0]
  def up
    remove_index :health_body_weights, %i[account_id created_date]
    remove_column :health_body_weights, :created_date

    remove_index :health_body_measures, %i[account_id created_date]
    remove_column :health_body_measures, :created_date
  end

  def down
    # HealthBodyWeight
    add_column :health_body_weights, :created_date, :date, default: nil

    execute <<-SQL.squish
      UPDATE health_body_weights SET created_date = (created_at::text)::date;
      ALTER TABLE health_body_weights ALTER COLUMN created_date SET DEFAULT ('now'::text)::date;
      ALTER TABLE health_body_weights ALTER COLUMN created_date SET NOT NULL;
    SQL

    add_index :health_body_weights, %i[account_id created_date], unique: true

    # HealthBodyMeasure
    add_column :health_body_measures, :created_date, :date, default: nil

    execute <<-SQL.squish
      UPDATE health_body_measures SET created_date = (created_at::text)::date;
      ALTER TABLE health_body_measures ALTER COLUMN created_date SET DEFAULT ('now'::text)::date;
      ALTER TABLE health_body_measures ALTER COLUMN created_date SET NOT NULL;
    SQL

    add_index :health_body_measures, %i[account_id created_date], unique: true
  end
end
