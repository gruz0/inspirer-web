# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shared::Utils::Normalizer do
  subject(:normalizer) { described_class.new }

  describe '#normalize_url' do
    it 'converts nil-value to empty string' do
      expect(normalizer.normalize_url(nil)).to eq('')
    end

    it 'removes spaces from the url' do
      expect(normalizer.normalize_url(' https://example.com/123 ')).to eq('https://example.com/123')
    end
  end

  describe '#normalize_title' do
    it 'converts nil-value to empty string' do
      expect(normalizer.normalize_title(nil)).to eq('')
    end

    it 'removes newlines' do
      expect(normalizer.normalize_title("My\nNew\nPost")).to eq('MyNewPost')
    end

    it 'replaces extra spaces with one space' do
      expect(normalizer.normalize_title('My   New    Post')).to eq('My New Post')
    end

    it 'removes leading and ending spaces' do
      expect(normalizer.normalize_title(' My New Post ')).to eq('My New Post')
    end
  end
end
