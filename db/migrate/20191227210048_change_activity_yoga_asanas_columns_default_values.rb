# frozen_string_literal: true

class ChangeActivityYogaAsanasColumnsDefaultValues < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:activity_yoga_asanas, :notes, false)
    change_column_null(:activity_yoga_asanas, :feeling, false)
  end
end
