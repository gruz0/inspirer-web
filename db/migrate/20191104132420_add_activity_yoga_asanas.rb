# frozen_string_literal: true

class AddActivityYogaAsanas < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_yoga_asanas do |t|
      t.column :feeling, :feelings
      t.text :notes
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
