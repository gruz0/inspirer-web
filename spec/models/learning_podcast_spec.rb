# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningPodcast, type: :model do
  subject(:model) { build(:learning_podcast) }

  # Account
  it { is_expected.to belong_to(:account) }

  # URL
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_uniqueness_of(:url).scoped_to(:account_id).case_insensitive }
  it { is_expected.to allow_value('https://example.com/?page=123').for(:url) }
  it { is_expected.not_to allow_value('example.com').for(:url) }

  describe '#normalize_url' do
    it 'returns value without spaces' do
      model.url = '  http://example.com    '
      model.validate

      expect(model.url).to eq('http://example.com')
    end
  end

  # Title
  it { is_expected.to validate_length_of(:title).is_at_most(100) }
  it { is_expected.to allow_values([nil, '']).for(:title) }
  it { is_expected.not_to allow_value(FFaker::Lorem.paragraph).for(:title) }

  describe '#normalize_title' do
    it 'returns value without spaces' do
      model.title = '  My Awesome Podcast    '
      model.validate

      expect(model.title).to eq('My Awesome Podcast')
    end
  end

  # Feeling
  it_behaves_like 'it validates feeling'

  # Notes
  it_behaves_like 'it sanitizes notes'
end
