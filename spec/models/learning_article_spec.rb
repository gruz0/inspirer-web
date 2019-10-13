# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningArticle, type: :model do
  subject(:model) { build(:learning_article) }

  # URL
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_uniqueness_of(:url).scoped_to(:account_id).case_insensitive }
  it { is_expected.to allow_value('https://example.com/?page=123').for(:url) }
  it { is_expected.not_to allow_value('example.com').for(:url) }

  it { is_expected.to validate_length_of(:title).is_at_most(100) }

  it_behaves_like 'it sanitizes notes'

  describe 'validations' do
    describe '#title' do
      it 'is valid' do
        expect(model).to be_valid
      end

      it 'is invalid if length is above than 100 characters' do
        model.title = FFaker::Lorem.paragraph
        expect(model).to be_invalid
      end
    end
  end
end
