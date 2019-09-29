# frozen_string_literal: true

class CreateHealthBodyMeasures < ActiveRecord::Migration[5.2]
  def up
    execute <<-DDL
          CREATE TYPE body_measure_units AS ENUM (
            'cm', 'inch'
          );
    DDL

    create_table :health_body_measures do |t|
      t.integer :chest
      t.integer :waist
      t.integer :hips
      t.column :unit, :body_measure_units
      t.string :feeling
      t.text :notes
      t.references :account, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :health_body_measures
    execute 'DROP type body_measure_units;'
  end
end
