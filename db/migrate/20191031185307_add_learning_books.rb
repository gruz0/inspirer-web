# frozen_string_literal: true

class AddLearningBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_books do |t|
      t.string :title, null: false, limit: 100
      t.string :author, null: false, default: '', limit: 100
      t.string :url, null: false, default: ''
      t.column :status, :learning_book_statuses, null: false
      t.column :feeling, :feelings, null: false
      t.text :notes, null: false, default: ''
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
