# frozen_string_literal: true

class ActivityCustomWorkout < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer
  include Normalizers

  belongs_to :account

  before_validation :normalize_title

  enum feeling: FEELINGS

  validates :title, presence: true, length: { maximum: 100 }
  validates :feeling, presence: true
end
