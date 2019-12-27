# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityCustomWorkout, type: :model do
  subject(:model) { build(:activity_custom_workout) }

  it { is_expected.to belong_to(:account) }
end
