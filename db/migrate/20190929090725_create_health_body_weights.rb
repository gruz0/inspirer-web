# frozen_string_literal: true

class CreateHealthBodyWeights < ActiveRecord::Migration[5.2]
  def up
    execute <<-DDL.squish
      CREATE TYPE weight_units AS ENUM (
        'kg', 'lbs'
      );
    DDL

    create_table :health_body_weights do |t|
      t.float :weight
      t.column :unit, :weight_units
      t.string :feeling
      t.text :notes
      t.references :account, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :health_body_weights
    execute 'DROP type weight_units;'
  end
end
