# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction'
require 'dry/transaction/operation'

RSpec.describe Health::BodyMeasures::Operations::AssignAttributes do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { create(:account) }
  let(:health_body_measure) { account.health_body_measure.new }

  let(:input) do
    {
      resource: health_body_measure,
      attributes: {
        chest: 91.539,
        waist: 65.150,
        hips: 89.391,
        unit: 'cm',
        feeling: 'good',
        notes: html_ipsum('My Notes')
      }
    }
  end

  it 'is success' do
    expect(operation).to be_success
  end

  it 'assigns unit' do
    expect(resource.unit).to eq('cm')
  end

  it 'assigns chest' do
    expect(resource.chest).to eq(91.5)
  end

  it 'assigns waist' do
    expect(resource.waist).to eq(65.1)
  end

  it 'assigns hips' do
    expect(resource.hips).to eq(89.3)
  end

  it 'assigns feeling' do
    expect(resource.feeling).to eq('good')
  end

  it 'assigns notes' do
    expect(resource.notes).to eq('My Notes')
  end
end
