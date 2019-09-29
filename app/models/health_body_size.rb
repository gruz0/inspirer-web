# frozen_string_literal: true

class HealthBodySize < ApplicationRecord
  belongs_to :account

  validates :chest, presence: true, numericality: { greater_than: 0 }
  validates :waist, presence: true, numericality: { greater_than: 0 }
  validates :hips, presence: true, numericality: { greater_than: 0 }
  validates :feeling, presence: true, inclusion: { in: FEELINGS.keys.map(&:to_s) }
end
