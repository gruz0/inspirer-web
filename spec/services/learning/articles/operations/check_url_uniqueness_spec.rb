# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Learning::Articles::Operations::CheckURLUniqueness do
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
    before { learning_article.update(input[:attributes]) }

    it { is_expected.to be_failure }

    it 'returns error' do
      expect(operation.failure).to eq(['URL has already been taken'])
    end
  end
end
