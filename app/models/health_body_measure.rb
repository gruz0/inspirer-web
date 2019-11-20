# frozen_string_literal: true

class HealthBodyMeasure < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

  belongs_to :account

  enum unit: BODY_MEASURE_UNITS
  enum feeling: FEELINGS

  validates :chest, presence: true
  validates :waist, presence: true
  validates :hips, presence: true
  validates :unit, presence: true
  validates :feeling, presence: true
end
