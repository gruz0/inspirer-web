# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shared::Utils::Sanitizer do
  subject(:sanitizer) { described_class.new }

  describe '#sanitize_html' do
    it 'converts nil-value to empty string' do
      expect(sanitizer.sanitize_html(nil)).to eq('')
    end

    it 'removes HTML' do
      expect(sanitizer.sanitize_html(html_ipsum('My Notes'))).to eq('My Notes')
    end
  end
end
