# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Activity::OutdoorWalks::Operations::AssignAttributes do
  subject(:operation) { described_class.new.call(input) }

  let(:result) { operation.value![:resource] }
  let(:resource) { build_stubbed(:activity_outdoor_walk, created_at: '2020-01-18 15:15:30') }

  let(:input) do
    {
      resource: resource,
      attributes: {
        distance: 15.35,
        steps: 18_815,
        distance_unit: 'km',
        feeling: 'good',
        notes: html_ipsum('My Notes'),
        created_at: '2020-01-19 15:31:12'
      }
    }
  end

  it { is_expected.to be_success }

  it 'assigns distance_unit' do
    expect(result.distance_unit).to eq('km')
  end

  it 'assigns distance' do
    expect(result.distance).to eq(15.3)
  end

  it 'assigns steps' do
    expect(result.steps).to eq(18_815)
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
