# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::Yoga::Asanas::Schemas::AsanaSchema do
  subject(:result) { described_class.call(input) }

  let(:errors) { result.errors.to_h }
  let(:input) do
    {
      attributes: {
        notes: notes,
        feeling: feeling
      }
    }
  end
  let(:notes) { 'Asana' }
  let(:feeling) { 'good' }

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
end
