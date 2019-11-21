# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Sleeps::Service do
  subject(:service) { described_class.new }

  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.send(:create, input) }

    let(:input) do
      {
        resource: account.health_sleep,
        attributes: attributes_for(:health_sleep)
      }
    end

    it { is_expected.to be_success }

    context 'when record for this day already exists' do
      before { create(:health_sleep, account: account) }

      it { is_expected.to be_failure }

      it 'has error message' do
        expect(result.failure).to include('Record for this day already exists')
      end
    end
  end

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) do
      create(
        :health_sleep,
        woke_up_at_hour: 7,
        woke_up_at_minutes: 15,
        feeling: 'good'
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          woke_up_at_hour: 8,
          woke_up_at_minutes: 43,
          feeling: 'amazing',
          notes: html_ipsum('Awesome Day')
        }
      }
    end

    it { is_expected.to be_success }

    it 'updates woke_up_at_hour' do
      expect { result }.to change(resource.reload, :woke_up_at_hour).from(7).to(8)
    end

    it 'updates woke_up_at_minutes' do
      expect { result }.to change(resource.reload, :woke_up_at_minutes).from(15).to(43)
    end

    it 'updates feeling' do
      expect { result }.to change(resource.reload, :feeling).from('good').to('amazing')
    end

    it 'updates notes' do
      expect { result }.to change(resource.reload, :notes).from('').to('Awesome Day')
    end
  end
end
