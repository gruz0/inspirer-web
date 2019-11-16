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
    context 'when it is a string and uses point as a delimiter' do
      let(:weight) { '123.45' }

      it { is_expected.to be_success }
    end

    context 'when it uses a comma as a delimiter' do
      let(:weight) { '123,45' }

      it { is_expected.to be_success }
    end

    context 'when it is not a float' do
      let(:weight) { 'abc123,45a' }

      it { is_expected.to be_failure }
    end

    context 'when it is an integer' do
      let(:weight) { 1 }

      it { is_expected.to be_success }
    end

    context 'when it is zero' do
      let(:weight) { 0 }

      it { is_expected.to be_failure }
    end

    context 'when it is less than zero' do
      let(:weight) { -1 }

      it { is_expected.to be_failure }
    end
  end

  describe 'unit' do
    context 'when unit has invalid value' do
      let(:unit) { 'unknown' }

      it { is_expected.to be_failure }
    end
  end

  describe 'feeling' do
    context 'when feeling has invalid value' do
      let(:feeling) { 'unknown' }

      it { is_expected.to be_failure }
    end
  end
end
