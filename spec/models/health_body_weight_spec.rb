# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthBodyWeight, type: :model do
  subject(:model) { build(:health_body_weight) }

  it { is_expected.to belong_to(:account) }
end
