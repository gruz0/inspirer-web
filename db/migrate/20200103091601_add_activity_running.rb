# frozen_string_literal: true

class AddActivityRunning < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_running do |t|
      t.float :distance, null: false
      t.column :distance_unit, :distance_units, null: false
      t.column :feeling, :feelings, null: false
      t.text :notes, null: false, default: ''
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
