# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::CustomWorkouts::Service do
  subject(:service) { described_class.new }

  let(:account) { create(:account) }

  describe '#create' do
    subject(:result) { service.send(:create, input) }

    let(:input) do
      {
        resource: account.activity_custom_workout,
        attributes: attributes_for(:activity_custom_workout)
      }
    end

    it { is_expected.to be_success }
  end

  describe '#update' do
    subject(:result) { service.send(:update, input) }

    let(:resource) do
      create(
        :activity_custom_workout,
        title: 'My Workout',
        feeling: 'good'
      )
    end

    let(:input) do
      {
        resource: resource,
        attributes: {
          title: 'Benchpress',
          feeling: 'amazing',
          notes: html_ipsum('Awesome Day')
        }
      }
    end

    it { is_expected.to be_success }

    it 'updates title' do
      expect { result }.to change(resource.reload, :title).from('My Workout').to('Benchpress')
    end

    it 'updates feeling' do
      expect { result }.to change(resource.reload, :feeling).from('good').to('amazing')
    end

    it 'updates notes' do
      expect { result }.to change(resource.reload, :notes).from('').to('Awesome Day')
    end
  end
end
