# frozen_string_literal: true

class HealthSleep < ApplicationRecord
  include HTMLSanitizer
  include NotesSanitizer

  belongs_to :account

  before_validation :set_created_date, on: [:create]

  enum feeling: FEELINGS

  validates :woke_up_at_hour, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 24 }
  validates :woke_up_at_minutes, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 60 }
  validates :feeling, presence: true
  validates :created_date, uniqueness: { scope: :account_id, message: 'should happen once per day' }

  private

  # NOTE: It uses for validate uniqueness with database constraints
  def set_created_date
    self.created_date = Time.zone.now
  end
end
