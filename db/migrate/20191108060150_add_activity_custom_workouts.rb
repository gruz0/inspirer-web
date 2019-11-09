# frozen_string_literal: true

class AddActivityCustomWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_custom_workouts do |t|
      t.string :title, null: false, limit: 100
      t.text :notes, null: false, default: ''
      t.column :feeling, :feelings, null: false
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
