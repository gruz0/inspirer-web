# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::OutdoorWalks::Contracts::UpdateContract do
  subject(:contract) { described_class.new.call(input) }

  let(:errors) { contract.errors.to_h }
  let(:input) do
    {
      attributes: {
        distance_unit: 'km',
        distance: '5,34',
        steps: 5_123,
        feeling: 'good'
      }
    }
  end

  it { is_expected.to be_success }
end
