# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shared::Utils::HTMLSanitizer do
  subject(:result) { described_class.new.call(input) }

  let(:input) { html_ipsum('My Notes') }

  it { is_expected.to eq('My Notes') }
end
