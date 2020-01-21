# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Health::BodyMeasures::Operations::AssignAttributes do
  subject(:operation) { described_class.new.call(input) }

  let(:result) { operation.value![:resource] }
  let(:resource) { build_stubbed(:health_body_measure, created_at: '2020-01-18 15:15:30') }

  let(:input) do
    {
      resource: resource,
      attributes: {
        chest: 91.539,
        waist: 65.150,
        hips: 89.391,
        unit: unit,
        feeling: 'good',
        notes: html_ipsum('My Notes'),
        created_at: '2020-01-19 15:31:12'
      }
    }
  end
  let(:unit) { 'cm' }

  it { is_expected.to be_success }

  it 'assigns unit' do
    expect(result.unit).to eq('cm')
  end

  context 'when unit is cm' do
    it 'floors chest by 1' do
      expect(result.chest).to eq(91.5)
    end

    it 'floors waist by 1' do
      expect(result.waist).to eq(65.1)
    end

    it 'floors hips by 1' do
      expect(result.hips).to eq(89.3)
    end
  end

  context 'when unit is inch' do
    let(:unit) { 'inch' }

    it 'floors chest by 2' do
      expect(result.chest).to eq(91.53)
    end

    it 'floors waist by 2' do
      expect(result.waist).to eq(65.15)
    end

    it 'floors hips by 2' do
      expect(result.hips).to eq(89.39)
    end
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
