# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Shared::Operations::FetchLinkTitle do
  subject(:operation) { described_class.new.call(input) }

  let(:learning_article) { create(:learning_article, attributes) }
  let(:attributes) { attributes_for(:learning_article) }
  let(:input) do
    {
      resource: learning_article
    }
  end

  context 'when title is empty' do
    before { attributes[:title] = '' }

    it 'starts worker' do
      expect { operation }.to change(FetchLinkTitleWorker.jobs, :size).by(1)
    end
  end

  context 'when title is not empty' do
    before { attributes[:title] = 'Post Title' }

    it 'does not start worker' do
      expect { operation }.not_to change(FetchLinkTitleWorker.jobs, :size)
    end
  end
end
