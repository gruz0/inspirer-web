# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningArticle, type: :model do
  subject(:model) { build(:learning_article) }

  it { is_expected.to belong_to(:account) }
end
