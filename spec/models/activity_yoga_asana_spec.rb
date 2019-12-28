# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityYogaAsana, type: :model do
  subject(:model) { build(:activity_yoga_asana) }

  it { is_expected.to belong_to(:account) }
end
