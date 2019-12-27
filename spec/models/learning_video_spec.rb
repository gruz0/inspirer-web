# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningVideo, type: :model do
  subject(:model) { build(:learning_video) }

  it { is_expected.to belong_to(:account) }
end
