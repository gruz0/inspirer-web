# frozen_string_literal: true

RSpec.shared_examples 'it validates contract' do
  subject(:contract) { described_class.new.call(input) }

  let(:errors) { contract.errors.to_h }

  it { is_expected.to be_success }
end
