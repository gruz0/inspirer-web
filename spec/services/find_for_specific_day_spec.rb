# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindForSpecificDay do
  subject(:result) { described_class.new.call(resource, date) }

  let(:account) { create(:account) }
  let(:resource) { create(:health_body_weight, account: account) }
  let(:date) { '2020-01-19 15:00:31' }

  context 'when there are no records' do
    it { is_expected.to be_nil }
  end

  context 'when record for current account already exists for the requested date' do
    let(:another_record) { create(:health_body_weight, account: account, created_at: '2020-01-19 12:00') }

    before { another_record }

    it { is_expected.to eq(another_record) }
  end

  context 'when record for current account already exists for another date' do
    let(:another_record) { create(:health_body_weight, account: account, created_at: '2020-01-18 12:00') }

    before { another_record }

    it { is_expected.to be_nil }
  end

  context 'when record for another account exists' do
    before { create(:health_body_weight, created_at: '2020-01-19 10:13') }

    it { is_expected.to be_nil }
  end
end
