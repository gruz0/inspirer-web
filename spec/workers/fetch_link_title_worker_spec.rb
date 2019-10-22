# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FetchLinkTitleWorker do
  subject(:worker) { described_class.new }

  let(:model) { 'LearningArticle' }
  let(:learning_article) { create(:learning_article, title: '') }
  let(:record_id) { learning_article.id }
  let(:url) { 'http://example.com' }

  before do
    method_call = double
    allow(method_call).to receive(:call).with(url).and_return(title: 'Title', h1: 'Header 1')
    allow(Utils::SiteParser).to receive(:new).and_return(method_call)
  end

  context 'when params valid' do
    it 'updates title' do
      worker.perform(model, record_id, url)

      expect(learning_article.reload.title).to eq('Header 1')
    end
  end

  context 'when params are not valid' do
    context 'when record was not found by ID' do
      let(:record_id) { 42_000 }

      it 'does not update title' do
        worker.perform(model, record_id, url)

        expect(learning_article.reload.title).to eq('')
      end
    end

    context 'when URL is not set' do
      let(:url) {}

      before do
        allow(Utils::SiteParser).to receive(:new).and_call_original
      end

      it 'does not update title' do
        worker.perform(model, record_id, url)

        expect(learning_article.reload.title).to eq('')
      end
    end

    context 'when TITLE and H1 tags were not found on the page' do
      before do
        method_call = double
        allow(method_call).to receive(:call).with(url).and_return({})
        allow(Utils::SiteParser).to receive(:new).and_return(method_call)
      end

      it 'does not update title' do
        worker.perform(model, record_id, url)

        expect(learning_article.reload.title).to eq('')
      end
    end
  end
end
