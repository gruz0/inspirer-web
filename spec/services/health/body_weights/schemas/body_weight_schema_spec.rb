# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyWeights::Schemas::BodyWeightSchema do
  subject(:result) { described_class.call(input) }

  let(:input) do
    {
      attributes: {
        weight: weight,
        unit: unit,
        feeling: feeling
      }
    }
  end
  let(:weight) { 123.45 }
  let(:unit) { 'kg' }
  let(:feeling) { 'good' }

  it { is_expected.to be_success }

  describe 'weight' do
    include_examples 'it allows to use comma as a delimiter', :weight
    include_examples 'it validates integer', :weight
  end

  describe 'unit' do
    include_examples 'it validates enum', :unit, WEIGHT_UNITS
  end

  describe 'feeling' do
    include_examples 'it validates enum', :feeling, FEELINGS
  end
end
