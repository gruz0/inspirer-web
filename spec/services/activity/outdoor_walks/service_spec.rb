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
  end

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) do
      create(
        :activity_outdoor_walk,
        distance: 12.1,
        steps: 15_341,
        distance_unit: 'km',
        feeling: 'good',
        created_at: Time.zone.parse('2020-01-19 15:30:03')
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          distance: '12,53',
          steps: 15_583,
          distance_unit: 'mi',
          feeling: 'amazing',
          notes: html_ipsum('Awesome Day'),
          created_at: '2020-01-18 12:15:31'
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

    it 'updates created_at' do
      expect { result }.to change(resource.reload, :created_at)
        .from(Time.zone.parse('2020-01-19 15:30:03'))
        .to(Time.zone.parse('2020-01-18 12:15:31'))
    end
  end
end
