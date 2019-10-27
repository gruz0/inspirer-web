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

  before do
    allow(URI).to receive(:open).and_return(html)
    allow(File).to receive(:read).and_return(html)
  end

  describe 'exceptions' do
    context 'when url is not present' do
      let(:url) {}

      it 'raises exception' do
        expect { result }.to raise_exception(ArgumentError, 'URL could not be empty')
      end
    end

    context 'when <title> and <h1> were not found' do
      let(:title) {}
      let(:h1) {}

      it 'raises exception' do
        expect { result }.to raise_exception(StandardError, 'Could not find TITLE and H1 on the page')
      end
    end
  end

  context 'when parsing YouTube' do
    ['https://youtube.com/', 'https://youtu.be'].each do |youtube_link|
      let(:url) { youtube_link }

      it 'returns <title>' do
        expect(result[:title]).to eq('Page Title')
      end
    end
  end

  describe '<h1>' do
    context 'when tag found and has not an empty value' do
      it 'returns <h1>' do
        expect(result[:title]).to eq('Header 1')
      end
    end

    context 'when tag is not present' do
      let(:h1) {}

      it 'returns <title>' do
        expect(result[:title]).to eq('Page Title')
      end
    end

    context 'when tag is empty' do
      let(:h1) { '<h1>  </h1>' }

      it 'returns <title>' do
        expect(result[:title]).to eq('Page Title')
      end
    end
  end

  context 'when there are <h1> tags more than one' do
    let(:h1) { '<h1>Header 1</h1><h1>Another Header</h1>' }

    it 'returns first tag' do
      expect(result[:title]).to eq('Header 1')
    end

    context 'when first <h1> tag is empty' do
      let(:h1) { '<h1>  </h1><h1>   </h1><h1>Another Header</h1>' }

      it 'returns first non-empty tag' do
        expect(result[:title]).to eq('Another Header')
      end
    end
  end
end
