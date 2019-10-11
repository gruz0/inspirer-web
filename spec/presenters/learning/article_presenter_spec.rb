# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::ArticlePresenter do
  subject(:presenter) { described_class.new(learning_article) }

  let(:url) { FFaker::Internet.http_url }
  let(:title) { 'Test' }
  let(:learning_article) do
    create(:learning_article,
           url: url,
           title: '<script>alert("qwe");</script>' + title + '<strong>content</strong>')
  end

  describe '#clickable_title' do
    context 'when title provided' do
      it 'returns a link with sanitized title' do
        expect(presenter.clickable_title)
          .to eq('<a target="_blank" rel="noreferrer nofollow noopener" href="' + url + '">' + title + '</a>')
      end
    end

    context 'when title is empty' do
      let(:title) { '  ' }

      it 'returns a link with url in content' do
        expect(presenter.clickable_title)
          .to eq('<a target="_blank" rel="noreferrer nofollow noopener" href="' + url + '">' + url + '</a>')
      end
    end
  end
end
