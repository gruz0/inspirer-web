# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Health::Meditations::Operations::AssignAttributes do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { create(:account) }
  let(:health_meditation) { account.health_meditation.new }

  let(:input) do
    {
      resource: health_meditation,
      attributes: {
        notes: html_ipsum(' My Notes '),
        feeling: 'good'
      }
    }
  end

  it 'is success' do
    expect(operation).to be_success
  end

  it 'assigns notes' do
    expect(resource.notes).to eq('My Notes')
  end

  it 'assigns feeling' do
    expect(resource.feeling).to eq('good')
  end
end
