# frozen_string_literal: true

RSpec.shared_examples 'it validates feeling' do
  context 'when feeling has invalid value' do
    let(:feeling) { 'unknown' }

    it { is_expected.to be_failure }
  end
end
