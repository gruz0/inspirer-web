# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindByCreatedToday do
  subject(:result) { described_class.new.call(klass) }

  let(:account) { create(:account) }
  let(:health_body_weight) { create(:health_body_weight, account: account) }
  let(:klass) { account.health_body_weight }

  context 'when there are no records' do
    it { is_expected.to be_nil }
  end

  context 'when record for this day for current account already exists' do
    let(:existed_record) { create(:health_body_weight, account: account) }

    before { existed_record }

    it { is_expected.to eq(existed_record) }
  end

  context 'when record for this day for another account exists' do
    before { create(:health_body_weight) }

    it { is_expected.to be_nil }
  end
end
