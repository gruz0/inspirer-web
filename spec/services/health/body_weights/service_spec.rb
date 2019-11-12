# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyWeights::Service do
  let(:service) { described_class.new }
  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.create(input) }

    let(:input) do
      {
        resource: account.health_body_weight.new,
        attributes: attributes_for(:health_body_weight)
      }
    end

    it { is_expected.to be_success }
  end
end
