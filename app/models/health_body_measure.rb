# frozen_string_literal: true

class HealthBodyMeasure < ApplicationRecord
  belongs_to :account

  enum unit: BODY_MEASURE_UNITS

  validates :chest, presence: true, numericality: { greater_than: 0 }
  validates :waist, presence: true, numericality: { greater_than: 0 }
  validates :hips, presence: true, numericality: { greater_than: 0 }
  validates :feeling, presence: true, inclusion: { in: FEELINGS.keys.map(&:to_s) }
end
