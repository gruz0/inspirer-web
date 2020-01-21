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
  end

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) do
      create(
        :health_body_weight,
        unit: 'kg',
        weight: 99.5,
        feeling: 'good',
        created_at: Time.zone.parse('2020-01-19 15:30:03')
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          weight: 100.3,
          unit: 'lbs',
          feeling: 'amazing',
          notes: html_ipsum('Awesome Day'),
          created_at: '2020-01-18 12:15:31'
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

    it 'updates created_at' do
      expect { result }.to change(resource.reload, :created_at)
        .from(Time.zone.parse('2020-01-19 15:30:03'))
        .to(Time.zone.parse('2020-01-18 12:15:31'))
    end
  end
end
