# frozen_string_literal: true

class AddConfirmationFieldsToAccounts < ActiveRecord::Migration[5.2]
  def change
    change_table :accounts, bulk: true do |t|
      t.column :confirmation_token, :string
      t.column :confirmed_at, :datetime
      t.column :confirmation_sent_at, :datetime
      t.column :unconfirmed_email, :string

      t.index :confirmation_token, unique: true
    end
  end
end
