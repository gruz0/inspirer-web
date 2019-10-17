# frozen_string_literal: true

class HealthBodyMeasure < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

  belongs_to :account

  before_validation :set_created_date, on: [:create]
  after_validation :normalize_chest
  after_validation :normalize_waist
  after_validation :normalize_hips

  enum unit: BODY_MEASURE_UNITS
  enum feeling: FEELINGS

  validates :chest, presence: true, numericality: { greater_than: 0 }
  validates :waist, presence: true, numericality: { greater_than: 0 }
  validates :hips, presence: true, numericality: { greater_than: 0 }
  validates :unit, presence: true
  validates :feeling, presence: true
  validates :created_date, uniqueness: { scope: :account_id, message: 'should happen once per day' }

  private

  # NOTE: It uses for validate uniqueness with database constraints
  def set_created_date
    self.created_date = Time.zone.now
  end

  def normalize_chest
    return unless chest

    self.chest = chest.floor(inch? ? 2 : 1)
  end

  def normalize_waist
    return unless waist

    self.waist = waist.floor(inch? ? 2 : 1)
  end

  def normalize_hips
    return unless hips

    self.hips = hips.floor(inch? ? 2 : 1)
  end
end
