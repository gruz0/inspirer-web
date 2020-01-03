# frozen_string_literal: true

class ActivityRunning < ApplicationRecord
  self.table_name = 'activity_running'

  belongs_to :account
end
