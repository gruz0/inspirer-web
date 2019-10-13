# frozen_string_literal: true

class LearningArticle < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

  belongs_to :account

  enum feeling: FEELINGS

  validates :url, url: true, presence: true,
                  uniqueness: {
                    scope: :account_id,
                    case_sensitive: false
                  }
  validates :title, length: { maximum: 100 }
  validates :feeling, presence: true
end
