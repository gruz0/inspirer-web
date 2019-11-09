# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityCustomWorkout, type: :model do
  subject(:model) { build(:activity_custom_workout) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Title
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_most(100) }
  it { is_expected.not_to allow_value(FFaker::Lorem.paragraph).for(:title) }

  it_behaves_like 'it normalizes title'

  # Feeling
  it_behaves_like 'it validates feeling'

  # Notes
  it_behaves_like 'it sanitizes notes'
end