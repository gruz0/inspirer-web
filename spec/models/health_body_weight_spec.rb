# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthBodyWeight, type: :model do
  subject(:model) { build(:health_body_weight) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Weight
  it { is_expected.to validate_presence_of(:weight) }
  it { is_expected.to validate_numericality_of(:weight).is_greater_than(0) }

  # Unit
  it_behaves_like 'it has enum', :unit, WEIGHT_UNITS

  describe '#normalize_weight' do
    it 'returns rounded by 1' do
      model.weight = 95.99
      model.validate

      expect(model.weight).to eq(95.9)
    end
  end

  # Created at
  it_behaves_like 'it validates created_date'

  # Feeling
  it_behaves_like 'it validates feeling'

  # Notes
  it_behaves_like 'it sanitizes notes'
end
