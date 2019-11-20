# frozen_string_literal: true

RSpec.shared_examples 'it validates enum' do |key|
  context 'when enum has invalid value' do
    let(key) { 'unknown' }

    it { is_expected.to be_failure }
  end
end
