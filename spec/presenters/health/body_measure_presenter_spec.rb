# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyMeasurePresenter do
  subject(:presenter) { described_class.new(health_body_measure) }

  let(:health_body_measure) { create(:health_body_measure) }

  describe '#chest' do
    context 'when unit is cm' do
      it 'returns converted value' do
        health_body_measure.unit = :cm
        health_body_measure.chest = 90.0

        expect(presenter.chest).to eq(90.0)
      end
    end

    context 'when unit is inch' do
      it 'returns converted value' do
        health_body_measure.unit = :inch
        health_body_measure.chest = 34.4

        expect(presenter.chest).to eq('34 6/16')
      end
    end
  end

  describe '#waist' do
    context 'when unit is cm' do
      it 'returns converted value' do
        health_body_measure.unit = :cm
        health_body_measure.waist = 60.0

        expect(presenter.waist).to eq(60.0)
      end
    end

    context 'when unit is inch' do
      it 'returns converted value' do
        health_body_measure.unit = :inch
        health_body_measure.waist = 23.6

        expect(presenter.waist).to eq('23 10/16')
      end
    end
  end

  describe '#hips' do
    context 'when unit is cm' do
      it 'returns converted value' do
        health_body_measure.unit = :cm
        health_body_measure.hips = 93

        expect(presenter.hips).to eq(93.0)
      end
    end

    context 'when unit is inch' do
      it 'returns converted value' do
        health_body_measure.unit = :inch
        health_body_measure.hips = 36.6

        expect(presenter.hips).to eq('36 10/16')
      end
    end
  end
end
