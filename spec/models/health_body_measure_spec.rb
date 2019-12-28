# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthBodyMeasure, type: :model do
  subject(:model) { build(:health_body_measure) }

  it { is_expected.to belong_to(:account) }
end
