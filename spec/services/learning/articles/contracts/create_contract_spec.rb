# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Articles::Contracts::CreateContract do
  subject(:contract) { described_class.new.call(input) }

  let(:errors) { contract.errors.to_h }
  let(:input) do
    {
      attributes: attributes_for(:learning_article)
    }
  end

  it { is_expected.to be_success }

  describe 'rules' do
    describe 'url_format' do
      ['invalid', 'example.com', 'ftp://domain.tld'].each do |invalid_url|
        before { input[:attributes][:url] = invalid_url }

        it { is_expected.to be_failure }

        it 'has error' do
          expect(errors[:attributes][:url]).to eq(['not a valid URL format'])
        end
      end
    end
  end
end
