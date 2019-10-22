# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Utils::SiteParser do
  subject(:site_parser) { described_class.new }

  let(:result) { site_parser.call(url) }

  let(:html) do
    <<-HTML
      <html><head>#{title}</head><body>#{h1}</body></html>
    HTML
  end
  let(:title) { '<title>Page Title</title>' }
  let(:h1) { '<h1>Header 1</h1><h1>Header 2</h1>' }
  let(:url) { 'http://example.com' }

  before { allow(URI).to receive(:open).and_return(html) }

  describe 'exceptions' do
    context 'when url is not present' do
      let(:url) {}

      it 'raises exception' do
        expect { result }.to raise_exception(ArgumentError, 'URL could not be empty')
      end
    end
  end

  describe '#title' do
    context 'when title present' do
      it 'returns title' do
        expect(result[:title]).to eq('Page Title')
      end
    end

    context 'when title is not present' do
      let(:title) {}

      it 'returns nil' do
        expect(result[:title]).to be_nil
      end
    end

    context 'when title is empty' do
      let(:title) { '<title>  </title>' }

      it 'returns nil' do
        expect(result[:title]).to be_nil
      end
    end
  end

  describe '#h1' do
    context 'when h1 present' do
      it 'returns h1' do
        expect(result[:h1]).to eq('Header 1')
      end
    end

    context 'when h1 is not present' do
      let(:h1) {}

      it 'returns nil' do
        expect(result[:h1]).to be_nil
      end
    end

    context 'when h1 is empty' do
      let(:h1) { '<h1>  </h1>' }

      it 'returns nil' do
        expect(result[:h1]).to be_nil
      end
    end

    context 'when there are h1 tags more than one' do
      let(:h1) { '<h1>Header 1</h1><h1>Another Header</h1>' }

      it 'returns first tag' do
        expect(result[:h1]).to eq('Header 1')
      end
    end
  end
end
