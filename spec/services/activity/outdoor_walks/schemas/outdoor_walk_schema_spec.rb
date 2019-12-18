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

  describe 'distance' do
    include_examples 'it allows to use comma as a delimiter', :distance
    include_examples 'it validates positive integer', :distance
  end

  describe 'steps' do
    include_examples 'it validates positive integer', :steps
  end

  describe 'distance_unit' do
    include_examples 'it validates enum', :distance_unit, DISTANCE_UNITS
  end

  describe 'feeling' do
    include_examples 'it validates enum', :feeling, FEELINGS
  end
end
