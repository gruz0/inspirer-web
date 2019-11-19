# frozen_string_literal: true

class ActivityOutdoorWalk < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

  belongs_to :account

  enum distance_unit: DISTANCE_UNITS
  enum feeling: FEELINGS

  validates :distance, presence: true
  validates :steps, presence: true
  validates :distance_unit, presence: true
  validates :feeling, presence: true
end
