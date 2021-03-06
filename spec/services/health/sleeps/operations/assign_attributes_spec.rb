# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Health::Sleeps::Operations::AssignAttributes do
  subject(:operation) { described_class.new.call(input) }

  let(:result) { operation.value![:resource] }
  let(:resource) { build_stubbed(:health_sleep, created_at: '2020-01-18 15:15:30') }

  let(:input) do
    {
      resource: resource,
      attributes: {
        woke_up_at_hour: '07',
        woke_up_at_minutes: '04',
        feeling: 'good',
        notes: html_ipsum('My Notes'),
        created_at: '2020-01-19 15:31:12'
      }
    }
  end

  it { is_expected.to be_success }

  it 'assigns woke_up_at_hour' do
    expect(result.woke_up_at_hour).to eq(7)
  end

  it 'assigns woke_up_at_minutes' do
    expect(result.woke_up_at_minutes).to eq(4)
  end

  it 'assigns feeling' do
    expect(result.feeling).to eq('good')
  end

  it 'assigns notes' do
    expect(result.notes).to eq('My Notes')
  end

  it 'assigns created_at' do
    expect(result.created_at).to eq(Time.zone.parse('2020-01-19 15:31:12'))
  end

  context "when the created_at's value is not set" do
    before { input[:attributes][:created_at] = nil }

    it 'does not change' do
      expect(result.created_at).to eq(Time.zone.parse('2020-01-18 15:15:30'))
    end
  end
end
