# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthBodyMeasure, type: :model do
  subject(:model) { build(:health_body_measure) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Chest
  it { is_expected.to validate_presence_of(:chest) }

  # Waist
  it { is_expected.to validate_presence_of(:waist) }

  # Hips
  it { is_expected.to validate_presence_of(:hips) }

  # Unit
  it_behaves_like 'it has enum', :unit, BODY_MEASURE_UNITS

  # Feeling
  it_behaves_like 'it has enum', :feeling, FEELINGS

  # Notes
  it_behaves_like 'it sanitizes notes'
end
