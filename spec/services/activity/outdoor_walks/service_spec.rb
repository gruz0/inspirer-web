# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::OutdoorWalks::Service do
  subject(:service) { described_class.new }

  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.send(:create, input) }

    let(:input) do
      {
        resource: account.activity_outdoor_walk,
        attributes: attributes_for(:activity_outdoor_walk)
      }
    end

    it { is_expected.to be_success }

    context 'when record for this day already exists' do
      before { create(:activity_outdoor_walk, account: account) }

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
        :activity_outdoor_walk,
        distance: 12.1,
        steps: 15_341,
        distance_unit: 'km',
        feeling: 'good'
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          distance: 12.5,
          steps: 15_583,
          distance_unit: 'mi',
          feeling: 'amazing',
          notes: html_ipsum('Awesome Day')
        }
      }
    end

    it { is_expected.to be_success }

    it 'updates distance' do
      expect { result }.to change(resource.reload, :distance).from(12.1).to(12.5)
    end

    it 'updates steps' do
      expect { result }.to change(resource.reload, :steps).from(15_341).to(15_583)
    end

    it 'updates distance_unit' do
      expect { result }.to change(resource.reload, :distance_unit).from('km').to('mi')
    end

    it 'updates feeling' do
      expect { result }.to change(resource.reload, :feeling).from('good').to('amazing')
    end

    it 'updates notes' do
      expect { result }.to change(resource.reload, :notes).from('').to('Awesome Day')
    end
  end
end
