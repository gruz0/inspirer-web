# frozen_string_literal: true

class AddLearningArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_articles do |t|
      t.string :url, null: false
      t.string :title
      t.column :feeling, :feelings, null: false
      t.text :notes
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
