# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shared::Utils::Container do
  subject(:container) { described_class }

  it 'has valid utils size' do
    expect(container.keys.size).to eq(2)
  end

  it 'has normalizer' do
    expect(container['normalizer']).to be_instance_of(Shared::Utils::Normalizer)
  end

  it 'has sanitizer' do
    expect(container['sanitizer']).to be_instance_of(Shared::Utils::Sanitizer)
  end
end
