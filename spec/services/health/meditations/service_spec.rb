# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Meditations::Service do
  subject(:service) { described_class.new }

  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.send(:create, input) }

    let(:input) do
      {
        resource: account.health_meditation,
        attributes: attributes_for(:health_meditation)
      }
    end

    it { is_expected.to be_success }
  end

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) do
      create(
        :health_meditation,
        notes: 'Meditation',
        feeling: 'good'
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          notes: html_ipsum(' My Meditation '),
          feeling: 'amazing'
        }
      }
    end

    it { is_expected.to be_success }

    it 'updates notes' do
      expect { result }.to change(resource.reload, :notes).from('Meditation').to('My Meditation')
    end

    it 'updates feeling' do
      expect { result }.to change(resource.reload, :feeling).from('good').to('amazing')
    end
  end
end
