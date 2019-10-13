# frozen_string_literal: true

class ChangeColumnsDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_table :learning_articles, bulk: true do |t|
      t.change :title, :string, null: false, default: '', limit: 100
      t.change :notes, :text, null: false, default: ''
    end

    change_table :health_sleeps do |t|
      t.change :notes, :text, null: false, default: ''
    end

    change_table :health_body_weights do |t|
      t.change :notes, :text, null: false, default: ''
    end

    change_table :health_body_measures do |t|
      t.change :notes, :text, null: false, default: ''
    end

    change_table :activity_outdoor_walks do |t|
      t.change :notes, :text, null: false, default: ''
    end
  end
end
