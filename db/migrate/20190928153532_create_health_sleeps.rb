# frozen_string_literal: true

class CreateHealthSleeps < ActiveRecord::Migration[5.2]
  def change
    create_table :health_sleeps do |t|
      t.integer :woke_up_at_hour
      t.integer :woke_up_at_minutes
      t.string :feeling
      t.text :notes
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
