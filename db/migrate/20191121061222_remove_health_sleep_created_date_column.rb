# frozen_string_literal: true

class RemoveHealthSleepCreatedDateColumn < ActiveRecord::Migration[6.0]
  def up
    remove_index :health_sleeps, %i[account_id created_date]
    remove_column :health_sleeps, :created_date
  end

  def down
    add_column :health_sleeps, :created_date, :date, default: nil

    execute <<-SQL.squish
      UPDATE health_sleeps SET created_date = (created_at::text)::date;
      ALTER TABLE health_sleeps ALTER COLUMN created_date SET DEFAULT ('now'::text)::date;
      ALTER TABLE health_sleeps ALTER COLUMN created_date SET NOT NULL;
    SQL

    add_index :health_sleeps, %i[account_id created_date], unique: true
  end
end
