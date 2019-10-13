# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LearningArticle, type: :model do
  subject(:model) { build_stubbed(:learning_article) }

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
