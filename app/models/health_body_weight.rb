# frozen_string_literal: true

class HealthBodyWeight < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

  belongs_to :account

  enum unit: WEIGHT_UNITS
  enum feeling: FEELINGS

  validates :weight, presence: true
  validates :unit, presence: true
  validates :feeling, presence: true
end
