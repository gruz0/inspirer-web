# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthSleep, type: :model do
  subject(:model) { build(:health_sleep) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Woke up at hour
  it { is_expected.to validate_presence_of(:woke_up_at_hour) }

  # Woke up at minutes
  it { is_expected.to validate_presence_of(:woke_up_at_minutes) }

  # Feeling
  include_examples 'it has enum', :feeling, FEELINGS

  # Notes
  include_examples 'it sanitizes notes'
end
