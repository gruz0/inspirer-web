# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::VideoPresenter do
  subject(:presenter) { described_class.new(learning_video) }

  let(:url) { FFaker::Internet.http_url }
  let(:title) { FFaker::Lorem.sentence }
  let(:learning_video) { create(:learning_video, url: url, title: "<strong>a</strong>#{title}") }

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
