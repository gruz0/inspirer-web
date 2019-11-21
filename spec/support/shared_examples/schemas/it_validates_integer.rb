# frozen_string_literal: true

RSpec.shared_examples 'it validates integer' do |key|
  context 'when it is a float' do
    let(key) { 23.45 }

    it { is_expected.to be_success }
  end

  context 'when it is not an integer' do
    let(key) { 'abc123,45a' }

    it { is_expected.to be_failure }
  end

  context 'when it is an integer' do
    let(key) { 1 }

    it { is_expected.to be_success }
  end
end
