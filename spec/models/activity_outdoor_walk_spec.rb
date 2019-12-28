# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityOutdoorWalk, type: :model do
  subject(:model) { build(:activity_outdoor_walk) }

  it { is_expected.to belong_to(:account) }
end
