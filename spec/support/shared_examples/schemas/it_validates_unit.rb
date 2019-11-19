# frozen_string_literal: true

RSpec.shared_examples 'it validates unit' do |key|
  context 'when unit has invalid value' do
    let(key) { 'unknown' }

    it { is_expected.to be_failure }
  end
end
