# frozen_string_literal: true

class LearningBook < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer
  include Normalizers

  belongs_to :account

  before_validation :normalize_url
  before_validation :normalize_title
  before_validation :normalize_author

  enum feeling: FEELINGS
  enum status: LEARNING_BOOK_STATUSES

  validates :title, presence: true, length: { maximum: 100 }
  validates :author, length: { maximum: 100 }
  validates :url, url: true, allow_blank: true
  validates :status, presence: true
  validates :feeling, presence: true

  private

  def normalize_author
    return unless author

    self.author = author.delete("\n").gsub(/\s+/, ' ').strip
  end
end
