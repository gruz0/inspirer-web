# frozen_string_literal: true

class CreateActivityWalks < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_walks do |t|
      t.float :distance, null: false
      t.column :distance_unit, :distance_units
      t.integer :steps, null: false
      t.column :feeling, :feelings
      t.text :notes
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
