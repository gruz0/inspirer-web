# frozen_string_literal: true

class HealthSleep < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

  belongs_to :account

  enum feeling: FEELINGS

  validates :woke_up_at_hour, presence: true
  validates :woke_up_at_minutes, presence: true
  validates :feeling, presence: true
end
