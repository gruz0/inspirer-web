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

  include_examples 'it allows to use comma as a delimiter', :distance

  include_examples 'it validates positive integer', :steps

  %i[distance_unit feeling].each { |key| include_examples 'it validates enum', key }
end
