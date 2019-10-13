# frozen_string_literal: true

class AddConfirmationFieldsToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :confirmation_token, :string
    add_column :accounts, :confirmed_at, :datetime
    add_column :accounts, :confirmation_sent_at, :datetime
    add_column :accounts, :unconfirmed_email, :string

    add_index :accounts, :confirmation_token, unique: true
  end
end
