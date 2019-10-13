# frozen_string_literal: true

class ChangeColumnsDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_table :learning_articles, bulk: true do |t|
      t.change :title, :string, null: false, default: '', limit: 100
    end
  end
end
