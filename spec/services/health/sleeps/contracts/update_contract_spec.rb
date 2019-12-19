# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Sleeps::Contracts::UpdateContract do
  subject(:contract) { described_class.new.call(input) }

  let(:errors) { contract.errors.to_h }
  let(:input) do
    {
      attributes: {
        woke_up_at_hour: 9,
        woke_up_at_minutes: 58,
        feeling: 'good'
      }
    }
  end

  it { is_expected.to be_success }
end
