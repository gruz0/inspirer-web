# frozen_string_literal: true

class LearningArticle < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

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

  private

  def normalize_url
    return unless url

    self.url = url.downcase.strip
  end

  def normalize_title
    return unless title

    self.title = title.strip
  end
end
