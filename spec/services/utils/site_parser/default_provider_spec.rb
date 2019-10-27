# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Utils::SiteParser::DefaultProvider do
  subject(:default_tag) { described_class.new.default_tag }

  it { is_expected.to eq(:h1) }
end
