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

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) { create(:health_body_weight, unit: 'kg', weight: 99.5, feeling: 'good') }

    let(:input) do
      {
        resource: resource,
        attributes: {
          weight: 100.3,
          unit: 'lbs',
          feeling: 'amazing',
          notes: html_ipsum('Awesome Day')
        }
      }
    end

    it { is_expected.to be_success }

    it 'updates weight' do
      expect { result }.to change(resource.reload, :weight).from(99.5).to(100.3)
    end

    it 'updates unit' do
      expect { result }.to change(resource.reload, :unit).from('kg').to('lbs')
    end

    it 'updates feeling' do
      expect { result }.to change(resource.reload, :feeling).from('good').to('amazing')
    end

    it 'updates notes' do
      expect { result }.to change(resource.reload, :notes).from('').to('Awesome Day')
    end
  end
end
