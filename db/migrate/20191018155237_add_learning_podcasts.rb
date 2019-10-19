# frozen_string_literal: true

class AddLearningPodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_podcasts do |t|
      t.string :url, null: false
      t.string :title, null: false, default: '', limit: 100
      t.column :feeling, :feelings, null: false
      t.text :notes, null: false, default: ''
      t.references :account, foreign_key: true

      t.timestamps
    end

    add_index :learning_podcasts, %i[account_id url], unique: true
  end
end
