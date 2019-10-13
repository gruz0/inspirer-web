# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningArticle, type: :model do
  subject(:model) { build(:learning_article) }

  # URL
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_uniqueness_of(:url).scoped_to(:account_id).case_insensitive }
  it { is_expected.to allow_value('https://example.com/?page=123').for(:url) }
  it { is_expected.not_to allow_value('example.com').for(:url) }

  # Title
  it { is_expected.to validate_length_of(:title).is_at_most(100) }
  it { is_expected.to allow_values([nil, '']).for(:title) }
  it { is_expected.not_to allow_value(FFaker::Lorem.paragraph).for(:title) }

  # Notes
  it_behaves_like 'it sanitizes notes'
end
