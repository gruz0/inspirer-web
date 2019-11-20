# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction'
require 'dry/transaction/operation'

RSpec.describe Shared::Operations::Persist do
  subject(:resource) { operation.value![:resource] }

  let(:operation) { described_class.new.call(input) }
  let(:account) { build(:account, attributes) }

  let(:input) do
    {
      resource: account,
      attributes: {}
    }
  end

  let(:attributes) do
    {
      email: 'me@domain.tld',
      password: 'myV3rySTr0ng',
      password_confirmation: 'myV3rySTr0ng'
    }
  end

  it 'is success' do
    expect(operation).to be_success
  end

  it { is_expected.to be_persisted }

  context 'with invalid attributes' do
    subject(:errors) { operation.failure[:errors] }

    let(:account) { Account.new }

    it 'is failure' do
      expect(operation).to be_failure
    end

    it 'has validation error' do
      expect(errors).to include("Validation failed: Email can't be blank, Password can't be blank")
    end
  end
end
