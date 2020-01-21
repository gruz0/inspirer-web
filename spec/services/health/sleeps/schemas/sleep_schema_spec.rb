# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Sleeps::Schemas::SleepSchema do
  subject(:result) { described_class.call(input) }

  let(:errors) { result.errors.to_h }
  let(:input) do
    {
      attributes: {
        woke_up_at_hour: woke_up_at_hour,
        woke_up_at_minutes: woke_up_at_minutes,
        feeling: feeling,
        created_at: created_at
      }
    }
  end
  let(:woke_up_at_hour) { 7 }
  let(:woke_up_at_minutes) { 15 }
  let(:feeling) { 'good' }
  let(:created_at) { '2020-01-19 12:03:13' }

  it { is_expected.to be_success }

  %i[woke_up_at_hour woke_up_at_minutes].each { |key| include_examples 'it validates integer', key }

  context 'when woke_up_at_hour is out of bound' do
    let(:woke_up_at_hour) { 24 }

    it { is_expected.to be_failure }
  end

  context 'when woke_up_at_minutes is out of bound' do
    let(:woke_up_at_minutes) { 60 }

    it { is_expected.to be_failure }
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
