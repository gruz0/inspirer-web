# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Shared::Operations::CheckURLUniqueness do
  subject(:operation) { described_class.new.call(input) }

  let(:account) { create(:account) }
  let(:learning_article) { account.learning_article.new }
  let(:input) do
    {
      resource: learning_article,
      attributes: attributes_for(:learning_article)
    }
  end

  it { is_expected.to be_success }

  context 'when URL already exists' do
    before { account.learning_article.create!(input[:attributes]) }

    it { is_expected.to be_failure }

    it 'returns error' do
      expect(operation.failure).to eq(['URL has already been taken'])
    end
  end

  context 'when try to update current resource' do
    before do
      resource = account.learning_article.create!(input[:attributes])
      input[:resource] = resource
    end

    it { is_expected.to be_success }
  end
end
