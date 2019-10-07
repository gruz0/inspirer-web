# frozen_string_literal: true

class ActivityOutdoorWalk < ApplicationRecord
  belongs_to :account

  before_validation :set_created_date, on: [:create]

  enum unit: DISTANCE_UNITS
  enum feeling: FEELINGS

  validates :distance, presence: true, numericality: { greater_than: 0 }
  validates :steps, presence: true, numericality: { greater_than: 0 }
  validates :created_date, uniqueness: { scope: :account_id, message: 'should happen once per day' }

  private

  # NOTE: It uses for validate uniqueness with database constraints
  def set_created_date
    self.created_date = Time.zone.now
  end
end
