# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::OutdoorWalks::Schemas::OutdoorWalkSchema do
  subject(:result) { described_class.call(input) }

  let(:input) do
    {
      attributes: {
        distance: distance,
        steps: steps,
        distance_unit: distance_unit,
        feeling: feeling
      }
    }
  end
  let(:distance) { 90.3 }
  let(:steps) { 15_931 }
  let(:distance_unit) { 'km' }
  let(:feeling) { 'good' }

  it { is_expected.to be_success }

  it_behaves_like 'it allows to use comma as a delimiter', :distance

  it_behaves_like 'it validates positive integer', :steps

  it_behaves_like 'it validates unit', :distance_unit

  it_behaves_like 'it validates feeling'
end
