# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::OutdoorWalks::Schemas::OutdoorWalkSchema do
  subject(:result) { described_class.call(input) }

  let(:errors) { result.errors.to_h }
  let(:input) do
    {
      attributes: {
        distance: distance,
        steps: steps,
        distance_unit: distance_unit,
        feeling: feeling,
        created_at: created_at
      }
    }
  end
  let(:distance) { 90.3 }
  let(:steps) { 15_931 }
  let(:distance_unit) { 'km' }
  let(:feeling) { 'good' }
  let(:created_at) { '2020-01-19 12:03:13' }

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

  describe 'created_at' do
    context 'when value is empty' do
      let(:created_at) { '' }

      it { is_expected.to be_success }
    end

    context 'when value is not a valid DateTime' do
      let(:created_at) { 'not-a-date-time' }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(errors[:attributes][:created_at]).to eq(['must be a date time'])
      end
    end
  end
end
