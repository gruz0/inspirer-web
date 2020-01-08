# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Activity::Runnings::Operations::AssignAttributes do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { create(:account) }
  let(:activity_running) { account.activity_running.new }

  let(:input) do
    {
      resource: activity_running,
      attributes: {
        distance: 15.35,
        distance_unit: 'km',
        feeling: 'good',
        notes: html_ipsum('My Notes')
      }
    }
  end

  it 'is success' do
    expect(operation).to be_success
  end

  it 'assigns distance_unit' do
    expect(resource.distance_unit).to eq('km')
  end

  it 'assigns distance' do
    expect(resource.distance).to eq(15.3)
  end

  it 'assigns feeling' do
    expect(resource.feeling).to eq('good')
  end

  it 'assigns notes' do
    expect(resource.notes).to eq('My Notes')
  end
end
