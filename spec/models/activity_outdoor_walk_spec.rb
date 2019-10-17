# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityOutdoorWalk, type: :model do
  subject(:model) { build(:activity_outdoor_walk) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Distance
  it { is_expected.to validate_presence_of(:distance) }
  it { is_expected.to validate_numericality_of(:distance).is_greater_than(0) }

  describe '#normalize_distance' do
    it 'returns rounded by 1' do
      model.distance = 17.35
      model.validate

      expect(model.distance).to eq(17.3)
    end
  end

  # Distance Unit
  it_behaves_like 'it has enum', :distance_unit, DISTANCE_UNITS

  # Steps
  it { is_expected.to validate_presence_of(:steps) }
  it { is_expected.to validate_numericality_of(:steps).only_integer.is_greater_than(0) }

  # Created at
  it_behaves_like 'it validates created_date'

  # Feeling
  it_behaves_like 'it validates feeling'

  # Notes
  it_behaves_like 'it sanitizes notes'
end
