# frozen_string_literal: true

class RemoveCreatedDateColumns < ActiveRecord::Migration[6.0]
  def up
    remove_index :health_body_weights, %i[account_id created_date]
    remove_column :health_body_weights, :created_date
  end

  def down
    add_column :health_body_weights, :created_date, :date, default: nil

    execute <<-SQL.squish
      UPDATE health_body_weights SET created_date = (created_at::text)::date;
      ALTER TABLE health_body_weights ALTER COLUMN created_date SET DEFAULT ('now'::text)::date;
      ALTER TABLE health_body_weights ALTER COLUMN created_date SET NOT NULL;
    SQL

    add_index :health_body_weights, %i[account_id created_date], unique: true
  end
end
