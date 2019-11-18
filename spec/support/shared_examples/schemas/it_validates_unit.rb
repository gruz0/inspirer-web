# frozen_string_literal: true

RSpec.shared_examples 'it validates unit' do
  context 'when unit has invalid value' do
    let(:unit) { 'unknown' }

    it { is_expected.to be_failure }
  end
end
