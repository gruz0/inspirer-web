# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningBook, type: :model do
  subject(:model) { build(:learning_book) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Title
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_most(100) }
  it { is_expected.not_to allow_value(FFaker::Lorem.paragraph).for(:title) }

  it_behaves_like 'it normalizes title'

  # Author
  it { is_expected.to validate_length_of(:author).is_at_most(100) }
  it { is_expected.to allow_values([nil, '']).for(:author) }
  it { is_expected.not_to allow_value(FFaker::Lorem.paragraph).for(:author) }

  describe '#normalize_author' do
    it 'returns value without spaces and newline symbols' do
      model.author = "\n  Sir   Arthur \nConan Doyle   \n"
      model.validate

      expect(model.author).to eq('Sir Arthur Conan Doyle')
    end
  end

  # URL
  it { is_expected.to allow_value(nil).for(:url) }
  it { is_expected.to allow_value('https://example.com/?page=123').for(:url) }
  it { is_expected.not_to allow_value('example.com').for(:url) }

  it_behaves_like 'it normalizes url'

  # Status
  it_behaves_like 'it has enum', :status, LEARNING_BOOK_STATUSES

  # Feeling
  it_behaves_like 'it validates feeling'

  # Notes
  it_behaves_like 'it sanitizes notes'
end
