# frozen_string_literal: true

class RenameActivityWalksToActivityOutdoorWalks < ActiveRecord::Migration[5.2]
  def up
    rename_index :activity_walks, :index_activity_walks_on_account_id, :index_activity_outdoor_walks_on_account_id
    rename_table :activity_walks, :activity_outdoor_walks
  end

  def down
    rename_index :activity_outdoor_walks,
                 :index_activity_outdoor_walks_on_account_id,
                 :index_activity_walks_on_account_id
    rename_table :activity_outdoor_walks, :activity_walks
  end
end
