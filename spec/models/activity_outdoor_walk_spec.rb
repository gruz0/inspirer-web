# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityOutdoorWalk, type: :model do
  subject(:model) { build(:activity_outdoor_walk) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Distance
  it { is_expected.to validate_presence_of(:distance) }

  # Steps
  it { is_expected.to validate_presence_of(:steps) }

  # Distance Unit
  include_examples 'it has enum', :distance_unit, DISTANCE_UNITS

  # Feeling
  include_examples 'it has enum', :feeling, FEELINGS

  # Notes
  include_examples 'it sanitizes notes'
end
