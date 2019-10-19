# frozen_string_literal: true

class LearningPodcast < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer
  include Normalizers

  belongs_to :account

  before_validation :normalize_url
  before_validation :normalize_title

  enum feeling: FEELINGS

  validates :url, url: true, presence: true,
                  uniqueness: {
                    scope: :account_id,
                    case_sensitive: false
                  }
  validates :title, length: { maximum: 100 }
  validates :feeling, presence: true
end
