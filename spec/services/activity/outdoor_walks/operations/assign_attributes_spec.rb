# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction'
require 'dry/transaction/operation'

RSpec.describe Activity::OutdoorWalks::Operations::AssignAttributes do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { create(:account) }
  let(:activity_outdoor_walk) { account.activity_outdoor_walk.new }

  let(:input) do
    {
      resource: activity_outdoor_walk,
      attributes: {
        distance: 15.35,
        steps: 18_815,
        distance_unit: 'km',
        feeling: 'good'
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

  it 'assigns steps' do
    expect(resource.steps).to eq(18_815)
  end

  it 'assigns feeling' do
    expect(resource.feeling).to eq('good')
  end
end
