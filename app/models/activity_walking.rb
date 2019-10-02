# frozen_string_literal: true

class ActivityWalking < ApplicationRecord
  belongs_to :account

  enum unit: DISTANCE_UNITS
  enum feeling: FEELINGS

  validates :distance, presence: true, numericality: { greater_than: 0 }
  validates :steps, presence: true, numericality: { greater_than: 0 }
end
