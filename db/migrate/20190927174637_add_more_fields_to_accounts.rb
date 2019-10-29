# frozen_string_literal: true

class AddMoreFieldsToAccounts < ActiveRecord::Migration[5.2]
  def change
    change_table :accounts, bulk: true do |t|
      t.column :username, :string
      t.column :name, :string
      t.column :website, :string
      t.column :bio, :text
    end
  end
end
