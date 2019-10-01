# frozen_string_literal: true

class HealthBodyWeight < ApplicationRecord
  belongs_to :account

  enum unit: WEIGHT_UNITS
  enum feeling: FEELINGS

  validates :weight, presence: true, numericality: { greater_than: 0 }
end
