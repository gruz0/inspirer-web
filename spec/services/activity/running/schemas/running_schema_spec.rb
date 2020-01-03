# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::Running::Schemas::RunningSchema do
  subject(:result) { described_class.call(input) }

  let(:input) do
    {
      attributes: {
        distance: distance,
        distance_unit: distance_unit,
        feeling: feeling
      }
    }
  end
  let(:distance) { 90.3 }
  let(:distance_unit) { 'km' }
  let(:feeling) { 'good' }

  it { is_expected.to be_success }

  describe 'distance' do
    include_examples 'it allows to use comma as a delimiter', :distance
    include_examples 'it validates positive integer', :distance
  end

  describe 'distance_unit' do
    include_examples 'it validates enum', :distance_unit, DISTANCE_UNITS
  end

  describe 'feeling' do
    include_examples 'it validates enum', :feeling, FEELINGS
  end
end
