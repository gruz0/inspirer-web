# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningPodcast, type: :model do
  subject(:model) { build(:learning_podcast) }

  it { is_expected.to belong_to(:account) }
end
