# frozen_string_literal: true

class CreateFeelings < ActiveRecord::Migration[5.2]
  def up
    execute <<-DDL.squish
      CREATE TYPE feelings AS ENUM (
        'amazing', 'happy', 'energetic', 'good', 'depressed', 'afraid', 'sad', 'angry'
      );
    DDL
  end

  def down
    execute 'DROP type feelings;'
  end
end
