# frozen_string_literal: true

class ActivityYogaAsana < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

  belongs_to :account

  enum feeling: FEELINGS

  validates :notes, presence: true
  validates :feeling, presence: true
end
