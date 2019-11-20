# frozen_string_literal: true

RSpec.shared_examples 'it allows to use comma as a delimiter' do |key|
  context 'when it is a string and uses point as a delimiter' do
    let(key) { '123.45' }

    it { is_expected.to be_success }
  end

  context 'when it uses a comma as a delimiter' do
    let(key) { '123,45' }

    it { is_expected.to be_success }
  end

  context 'when it is not a float' do
    let(key) { 'abc123,45a' }

    it { is_expected.to be_failure }
  end

  context 'when it is an integer' do
    let(key) { 1 }

    it { is_expected.to be_success }
  end

  context 'when it is zero' do
    let(key) { 0 }

    it { is_expected.to be_failure }
  end

  context 'when it is less than zero' do
    let(key) { -1 }

    it { is_expected.to be_failure }
  end
end
