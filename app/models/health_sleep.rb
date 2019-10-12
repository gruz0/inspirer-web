# frozen_string_literal: true

class HealthSleep < ApplicationRecord
  include HTMLSanitizer

  belongs_to :account

  before_validation :set_created_date, on: [:create]
  before_validation :sanitize_notes

  enum feeling: FEELINGS

  validates :woke_up_at_hour, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 24 }
  validates :woke_up_at_minutes, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 60 }
  validates :feeling, presence: true
  validates :created_date, uniqueness: { scope: :account_id, message: 'should happen once per day' }

  private

  def sanitize_notes
    self.notes = sanitize_html(notes)
  end

  # NOTE: It uses for validate uniqueness with database constraints
  def set_created_date
    self.created_date = Time.zone.now
  end
end
