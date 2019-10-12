# frozen_string_literal: true

class LearningArticle < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

  belongs_to :account

  enum feeling: FEELINGS

  validates :url, url: true, presence: true,
                  uniqueness: {
                    scope: :account,
                    case_sensitive: false,
                    message: 'already exists'
                  }
  validates :feeling, presence: true
end
