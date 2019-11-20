# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthBodyWeight, type: :model do
  subject(:model) { build(:health_body_weight) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Weight
  it { is_expected.to validate_presence_of(:weight) }

  # Unit
  include_examples 'it has enum', :unit, WEIGHT_UNITS

  # Feeling
  include_examples 'it has enum', :feeling, FEELINGS

  # Notes
  include_examples 'it sanitizes notes'
end
