# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Podcasts::Schemas::PodcastSchema do
  subject(:result) { described_class.call(input) }

  let(:errors) { result.errors.to_h }
  let(:input) do
    {
      attributes: {
        url: url,
        title: title,
        feeling: feeling
      }
    }
  end
  let(:url) { 'https://example.com' }
  let(:title) { '' }
  let(:feeling) { 'good' }

  it { is_expected.to be_success }

  describe 'url' do
    context 'when value is empty' do
      let(:url) { '' }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(errors[:attributes][:url]).to eq(['must be filled'])
      end
    end
  end

  describe 'title' do
    context 'when value length is higher than 100' do
      let(:title) { 'a' * 101 }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(errors[:attributes][:title]).to eq(['size cannot be greater than 100'])
      end
    end
  end

  describe 'feeling' do
    include_examples 'it validates enum', :feeling, FEELINGS
  end
end
