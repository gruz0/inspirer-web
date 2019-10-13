# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthBodyMeasure, type: :model do
  subject(:model) { build(:health_body_measure) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Chest
  it { is_expected.to validate_presence_of(:chest) }
  it { is_expected.to validate_numericality_of(:chest).is_greater_than(0) }

  # Waist
  it { is_expected.to validate_presence_of(:waist) }
  it { is_expected.to validate_numericality_of(:waist).is_greater_than(0) }

  # Hips
  it { is_expected.to validate_presence_of(:hips) }
  it { is_expected.to validate_numericality_of(:hips).is_greater_than(0) }

  # Unit
  it_behaves_like 'it has enum', :unit, BODY_MEASURE_UNITS

  # Created at
  it_behaves_like 'it validates created_date'

  # Feeling
  it_behaves_like 'it validates feeling'

  # Notes
  it_behaves_like 'it sanitizes notes'
end
