# frozen_string_literal: true

RSpec.shared_examples 'it validates positive integer' do |key|
  include_examples 'it validates integer', key

  context 'when it is zero' do
    let(key) { 0 }

    it { is_expected.to be_failure }
  end

  context 'when it is less than zero' do
    let(key) { -1 }

    it { is_expected.to be_failure }
  end
end
