# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Health::BodyWeights::Operations::AssignAttributes do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { create(:account) }
  let(:health_body_weight) { account.health_body_weight.new }

  let(:input) do
    {
      resource: health_body_weight,
      attributes: {
        weight: 115.641,
        unit: 'kg',
        feeling: 'good',
        notes: html_ipsum('My Notes')
      }
    }
  end

  it 'is success' do
    expect(operation).to be_success
  end

  it 'assigns unit' do
    expect(resource.unit).to eq('kg')
  end

  it 'assigns weight' do
    expect(resource.weight).to eq(115.6)
  end

  it 'assigns feeling' do
    expect(resource.feeling).to eq('good')
  end

  it 'assigns notes' do
    expect(resource.notes).to eq('My Notes')
  end
end
