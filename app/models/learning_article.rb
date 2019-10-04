# frozen_string_literal: true

class LearningArticle < ApplicationRecord
  belongs_to :account

  enum feeling: FEELINGS

  validates :url, presence: true, uniqueness: { scope: :account, case_sensitive: false }
end
