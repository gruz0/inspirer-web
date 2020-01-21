# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Shared::Operations::MustBeCreatedOncePerDay do
  subject(:operation) { described_class.new.call(input) }

  let(:result) { operation.value![:resource] }
  let(:account) { create(:account) }
  let(:resource) { build_stubbed(:health_sleep, account: account, created_at: '2020-01-20') }
  let(:input) do
    {
      resource: resource,
      attributes: {
        created_at: created_at
      }
    }
  end
  let(:created_at) { '2020-01-19' }

  context 'when there are no records' do
    it { is_expected.to be_success }
  end

  context 'when another one record found for the requested date for the current account' do
    let(:created_at) { '2020-01-20' }

    before { create(:health_sleep, account: account, created_at: '2020-01-20') }

    it { is_expected.to be_failure }
  end

  context 'when another one record exists for the requested date but for the another account' do
    let(:created_at) { '2020-01-20' }

    before { create(:health_sleep, created_at: '2020-01-20') }

    it { is_expected.to be_success }
  end
end
