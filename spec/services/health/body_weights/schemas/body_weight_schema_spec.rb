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

  context 'when weight is string and uses point as a delimiter' do
    let(:weight) { '123.45' }

    it { is_expected.to be_success }
  end

  context 'when weight uses comma as a delimiter' do
    let(:weight) { '123,45' }

    it { is_expected.to be_success }
  end

  context 'when weight is not a float' do
    let(:weight) { 'abc123,45a' }

    it { is_expected.to be_failure }
  end

  context 'when unit has invalid value' do
    let(:unit) { 'unknown' }

    it { is_expected.to be_failure }
  end

  context 'when feeling has invalid value' do
    let(:feeling) { 'unknown' }

    it { is_expected.to be_failure }
  end
end
