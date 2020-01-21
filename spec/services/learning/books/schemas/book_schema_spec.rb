# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Books::Schemas::BookSchema do
  subject(:result) { described_class.call(input) }

  let(:errors) { result.errors.to_h }
  let(:input) do
    {
      attributes: {
        title: title,
        author: author,
        status: status,
        feeling: feeling,
        created_at: created_at
      }
    }
  end
  let(:title) { 'My Book' }
  let(:author) { '' }
  let(:status) { 'new_book' }
  let(:feeling) { 'good' }
  let(:created_at) { '2020-01-19 12:03:13' }

  it { is_expected.to be_success }

  describe 'title' do
    context 'when value is empty' do
      let(:title) { '' }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(errors[:attributes][:title]).to eq(['must be filled'])
      end
    end

    context 'when value length is higher than 100' do
      let(:title) { 'a' * 101 }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(errors[:attributes][:title]).to eq(['size cannot be greater than 100'])
      end
    end
  end

  describe 'author' do
    context 'when value length is higher than 100' do
      let(:author) { 'a' * 101 }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(errors[:attributes][:author]).to eq(['size cannot be greater than 100'])
      end
    end
  end

  describe 'status' do
    include_examples 'it validates enum', :status, LEARNING_BOOK_STATUSES
  end

  describe 'feeling' do
    include_examples 'it validates enum', :feeling, FEELINGS
  end

  describe 'created_at' do
    context 'when value is empty' do
      let(:created_at) { '' }

      it { is_expected.to be_success }
    end

    context 'when value is not a valid DateTime' do
      let(:created_at) { 'not-a-date-time' }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(errors[:attributes][:created_at]).to eq(['must be a date time'])
      end
    end
  end
end
