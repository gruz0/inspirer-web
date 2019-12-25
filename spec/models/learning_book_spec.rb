# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningBook, type: :model do
  subject(:model) { build(:learning_book) }

  it { is_expected.to belong_to(:account) }
end
