# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyMeasures::Service do
  subject(:service) { described_class.new }

  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.send(:create, input) }

    let(:input) do
      {
        resource: account.health_body_measure,
        attributes: attributes_for(:health_body_measure)
      }
    end

    it { is_expected.to be_success }
  end

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) do
      create(
        :health_body_measure,
        chest: 90.3,
        waist: 66.8,
        hips: 91.9,
        unit: 'cm',
        feeling: 'good',
        created_at: Time.zone.parse('2020-01-19 15:30:03')
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          chest: 90.4,
          waist: 65.9,
          hips: 90.1,
          unit: 'inch',
          feeling: 'amazing',
          notes: html_ipsum('Awesome Day'),
          created_at: '2020-01-18 12:15:31'
        }
      }
    end

    it { is_expected.to be_success }

    it 'updates chest' do
      expect { result }.to change(resource.reload, :chest).from(90.3).to(90.4)
    end

    it 'updates waist' do
      expect { result }.to change(resource.reload, :waist).from(66.8).to(65.9)
    end

    it 'updates hips' do
      expect { result }.to change(resource.reload, :hips).from(91.9).to(90.1)
    end

    it 'updates unit' do
      expect { result }.to change(resource.reload, :unit).from('cm').to('inch')
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
