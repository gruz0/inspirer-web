# frozen_string_literal: true

class AddMoreFieldsToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :username, :string
    add_column :accounts, :name, :string
    add_column :accounts, :website, :string
    add_column :accounts, :bio, :text
  end
end
