# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::BookPresenter do
  subject(:presenter) { described_class.new(learning_book) }

  let(:title) { FFaker::Book.title }
  let(:url) { FFaker::Internet.http_url }
  let(:learning_book) { create(:learning_book, title: "<strong>a</strong>#{title}", url: url) }

  describe '#clickable_title' do
    context 'when url provided' do
      it 'returns a link with sanitized title' do
        expect(presenter.clickable_title)
          .to eq('<a target="_blank" rel="noreferrer nofollow noopener" href="' + url + '">' + title + '</a>')
      end
    end

    context 'when link is empty' do
      let(:url) { '' }

      it 'returns title' do
        expect(presenter.clickable_title).to eq(title)
      end
    end
  end
end
