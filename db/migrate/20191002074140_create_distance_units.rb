# frozen_string_literal: true

class CreateDistanceUnits < ActiveRecord::Migration[5.2]
  def up
    execute <<-DDL
      CREATE TYPE distance_units AS ENUM (
        'km', 'mi'
      );
    DDL
  end

  def down
    execute 'DROP type distance_units;'
  end
end
