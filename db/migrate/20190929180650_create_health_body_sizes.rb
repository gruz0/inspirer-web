# frozen_string_literal: true

class CreateHealthBodySizes < ActiveRecord::Migration[5.2]
  def change
    create_table :health_body_sizes do |t|
      t.integer :chest
      t.integer :waist
      t.integer :hips
      t.string :feeling
      t.text :notes
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
