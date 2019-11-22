# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction'
require 'dry/transaction/operation'

RSpec.describe Health::Sleeps::Operations::AssignAttributes do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { create(:account) }
  let(:health_sleep) { account.health_sleep.new }

  let(:input) do
    {
      resource: health_sleep,
      attributes: {
        woke_up_at_hour: 7,
        woke_up_at_minutes: 18,
        feeling: 'good'
      }
    }
  end

  it 'is success' do
    expect(operation).to be_success
  end

  it 'assigns woke_up_at_hour' do
    expect(resource.woke_up_at_hour).to eq(7)
  end

  it 'assigns woke_up_at_minutes' do
    expect(resource.woke_up_at_minutes).to eq(18)
  end

  it 'assigns feeling' do
    expect(resource.feeling).to eq('good')
  end
end
