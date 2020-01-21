# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::Yoga::Asanas::Service do
  subject(:service) { described_class.new }

  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.send(:create, input) }

    let(:input) do
      {
        resource: account.activity_yoga_asana,
        attributes: attributes_for(:activity_yoga_asana, created_at: '2020-01-19 12:15')
      }
    end

    it { is_expected.to be_success }
  end

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) do
      create(
        :activity_yoga_asana,
        notes: 'Asana',
        feeling: 'good',
        created_at: Time.zone.parse('2020-01-19 15:30:03')
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          notes: html_ipsum(' My Asana '),
          feeling: 'amazing',
          created_at: '2020-01-18 12:15:31'
        }
      }
    end

    it { is_expected.to be_success }

    it 'updates notes' do
      expect { result }.to change(resource.reload, :notes).from('Asana').to('My Asana')
    end

    it 'updates feeling' do
      expect { result }.to change(resource.reload, :feeling).from('good').to('amazing')
    end

    it 'updates created_at' do
      expect { result }.to change(resource.reload, :created_at)
        .from(Time.zone.parse('2020-01-19 15:30:03'))
        .to(Time.zone.parse('2020-01-18 12:15:31'))
    end
  end
end
