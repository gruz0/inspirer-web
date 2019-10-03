# frozen_string_literal: true

class LearningArticle < ApplicationRecord
  belongs_to :account

  enum feeling: FEELINGS

  validates :url, presence: true
end
