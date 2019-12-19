# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyWeights::Contracts::CreateContract do
  subject(:contract) { described_class.new.call(input) }

  let(:errors) { contract.errors.to_h }
  let(:input) do
    {
      attributes: {
        weight: '98,15',
        unit: 'kg',
        feeling: 'good'
      }
    }
  end

  it { is_expected.to be_success }
end
