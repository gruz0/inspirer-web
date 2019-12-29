# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthSleep, type: :model do
  subject(:model) { build(:health_sleep) }

  it { is_expected.to belong_to(:account) }
end
