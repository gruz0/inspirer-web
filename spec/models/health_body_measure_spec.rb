# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthBodyMeasure, type: :model do
  subject(:model) { build(:health_body_measure) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Chest
  it { is_expected.to validate_presence_of(:chest) }
  it { is_expected.to validate_numericality_of(:chest).is_greater_than(0) }

  describe '#normalize_chest' do
    context 'when unit is cm' do
      it 'returns rounded by 1' do
        model.unit = :cm
        model.chest = 30.27
        model.validate

        expect(model.chest).to eq(30.2)
      end
    end

    context 'when unit is inch' do
      it 'returns rounded by 2' do
        model.unit = :inch
        model.chest = 95.99
        model.validate

        expect(model.chest).to eq(95.99)
      end
    end
  end

  # Waist
  it { is_expected.to validate_presence_of(:waist) }
  it { is_expected.to validate_numericality_of(:waist).is_greater_than(0) }

  describe '#normalize_waist' do
    context 'when unit is cm' do
      it 'returns rounded by 1' do
        model.unit = :cm
        model.waist = 30.27
        model.validate

        expect(model.waist).to eq(30.2)
      end
    end

    context 'when unit is inch' do
      it 'returns rounded by 2' do
        model.unit = :inch
        model.waist = 95.99
        model.validate

        expect(model.waist).to eq(95.99)
      end
    end
  end

  # Hips
  it { is_expected.to validate_presence_of(:hips) }
  it { is_expected.to validate_numericality_of(:hips).is_greater_than(0) }

  describe '#normalize_hips' do
    context 'when unit is cm' do
      it 'returns rounded by 1' do
        model.unit = :cm
        model.hips = 30.27
        model.validate

        expect(model.hips).to eq(30.2)
      end
    end

    context 'when unit is inch' do
      it 'returns rounded by 2' do
        model.unit = :inch
        model.hips = 95.99
        model.validate

        expect(model.hips).to eq(95.99)
      end
    end
  end

  # Unit
  it_behaves_like 'it has enum', :unit, BODY_MEASURE_UNITS

  # Created at
  it_behaves_like 'it validates created_date'

  # Feeling
  it_behaves_like 'it validates feeling'

  # Notes
  it_behaves_like 'it sanitizes notes'
end
