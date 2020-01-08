# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityRunning, type: :model do
  subject(:model) { build(:activity_running) }

  it { is_expected.to belong_to(:account) }
end
