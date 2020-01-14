# frozen_string_literal: true

class AddHealthMeditations < ActiveRecord::Migration[6.0]
  def change
    create_table :health_meditations do |t|
      t.text :notes, null: false
      t.column :feeling, :feelings, null: false
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
