# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Utils::SiteParser::ProviderDetector do
  subject(:result) { described_class.new.detect!(url) }

  let(:url) {}

  context 'when url is empty' do
    it 'raises exception' do
      expect { result }.to raise_exception(ArgumentError, 'URL could not be empty')
    end
  end

  context 'when provider was not found by given url' do
    let(:url) { 'https://example.com' }

    it { is_expected.to be_an_instance_of(Utils::SiteParser::DefaultProvider) }
  end

  describe 'YouTube' do
    ['https://youtube.com', 'https://youtu.be'].each do |youtube_link|
      let(:url) { youtube_link }

      it { is_expected.to be_an_instance_of(Utils::SiteParser::YoutubeProvider) }
    end
  end
end
