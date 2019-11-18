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

  it_behaves_like 'it allows to use comma as a delimiter', :weight

  it_behaves_like 'it validates unit'

  it_behaves_like 'it validates feeling'
end
