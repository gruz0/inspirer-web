# frozen_string_literal: true

class HealthSleep < ApplicationRecord
  belongs_to :account

  enum feeling: FEELINGS

  validates :woke_up_at_hour, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 24 }
  validates :woke_up_at_minutes, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 60 }
end
