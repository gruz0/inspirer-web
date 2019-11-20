# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityYogaAsana, type: :model do
  subject(:model) { build(:activity_yoga_asana) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Notes
  it { is_expected.to validate_presence_of(:notes) }

  include_examples 'it sanitizes notes'

  # Feeling
  include_examples 'it has enum', :feeling, FEELINGS
end
