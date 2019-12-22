# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyMeasures::Contracts::UpdateContract do
  subject(:contract) { described_class.new.call(input) }

  let(:errors) { contract.errors.to_h }
  let(:input) do
    {
      attributes: {
        chest: '90,35',
        hips: '65,15',
        waist: '89,91',
        unit: 'cm',
        feeling: 'good'
      }
    }
  end

  it { is_expected.to be_success }
end
