# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyWeights::Service do
  subject(:service) { described_class.new }

  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.send(:create, input) }

    let(:input) do
      {
        resource: account.health_body_weight,
        attributes: attributes_for(:health_body_weight)
      }
    end

    it { is_expected.to be_success }

    context 'when record for this day already exists' do
      before { create(:health_body_weight, account: account) }

      it { is_expected.to be_failure }

      it 'has error message' do
        expect(result.failure).to include('Record for this day already exists')
      end
    end
  end
end
