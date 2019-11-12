# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyWeights::CreateService do
  let(:service) { described_class.new }

  let(:account) { create(:account) }
  let(:input) do
    {
      resource: account.health_body_weight.new,
      attributes: attributes
    }
  end

  describe '#call' do
    subject(:result) { service.call(input) }

    let(:attributes) { attributes_for(:health_body_weight) }

    it { is_expected.to be_success }

    it 'creates a new record' do
      expect { result }.to change(HealthBodyWeight, :count).by(1)
    end

    it 'contains resource' do
      expect(result.success).to include(:resource)
    end

    context 'when weight has comma as a delimiter' do
      let(:attributes) { attributes_for(:health_body_weight, weight: '12,34') }

      it { is_expected.to be_success }
    end

    context 'with invalid attributes' do
      let(:attributes) { {} }

      it { is_expected.to be_failure }

      it 'does not create a new record' do
        expect { result }.not_to change(HealthBodyWeight, :count)
      end

      it 'contains attributes' do
        expect(result.failure).to include(:attributes)
      end

      it 'contains errors' do
        expect(result.failure).to include(:errors)
      end

      it 'contains weight in errors' do
        expect(result.failure[:errors]).to include('weight is missing')
      end

      it 'containts unit in errors' do
        expect(result.failure[:errors]).to include('unit is missing')
      end

      it 'contains feeling in errors' do
        expect(result.failure[:errors]).to include('feeling is missing')
      end
    end

    context 'when weight is not a number' do
      let(:attributes) { { weight: 'abc' } }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(result.failure[:errors]).to include('weight must be a number')
      end
    end

    context 'when unit has invalid value' do
      let(:attributes) { { unit: 'abc' } }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(result.failure[:errors]).to include('unit must be one of: kg, lbs')
      end
    end

    context 'when feeling has invalid value' do
      let(:attributes) { { feeling: 'abc' } }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(result.failure[:errors])
          .to include('feeling must be one of: amazing, happy, energetic, good, depressed, afraid, sad, angry')
      end
    end
  end
end
