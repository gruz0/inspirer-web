# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Meditations::Schemas::MeditationSchema do
  subject(:result) { described_class.call(input) }

  let(:errors) { result.errors.to_h }
  let(:input) do
    {
      attributes: {
        notes: notes,
        feeling: feeling,
        created_at: created_at
      }
    }
  end
  let(:notes) { 'My Meditation' }
  let(:feeling) { 'good' }
  let(:created_at) { '2020-01-19 12:03:13' }

  it { is_expected.to be_success }

  describe 'notes' do
    context 'when value is empty' do
      let(:notes) { '' }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(errors[:attributes][:notes]).to eq(['must be filled'])
      end
    end
  end

  describe 'feeling' do
    include_examples 'it validates enum', :feeling, FEELINGS
  end

  describe 'created_at' do
    context 'when value is empty' do
      let(:created_at) { '' }

      it { is_expected.to be_success }
    end

    context 'when value is not a valid DateTime' do
      let(:created_at) { 'not-a-date-time' }

      it { is_expected.to be_failure }

      it 'returns error' do
        expect(errors[:attributes][:created_at]).to eq(['must be a date time'])
      end
    end
  end
end
