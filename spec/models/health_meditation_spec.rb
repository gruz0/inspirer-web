# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthMeditation, type: :model do
  subject(:model) { build(:health_meditation) }

  it { is_expected.to belong_to(:account) }
end
