# frozen_string_literal: true

class HealthBodyWeight < ApplicationRecord
  belongs_to :account

  enum unit: {
    kg: 'kg',
    lbs: 'lbs'
  }

  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :feeling, presence: true, inclusion: { in: FEELINGS.keys.map(&:to_s) }
end
