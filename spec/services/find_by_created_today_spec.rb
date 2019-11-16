# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindByCreatedToday do
  subject(:result) { described_class.new.call(klass) }

  let(:account) { create(:account) }
  let(:health_body_weight) { create(:health_body_weight, account: account) }
  let(:klass) { account.health_body_weight }

  context 'when there are no records' do
    it { is_expected.to be_falsey }
  end

  context 'when record for this day for current account already exists' do
    before { create(:health_body_weight, account: account) }

    it { is_expected.to be_truthy }
  end

  context 'when record for this day for another account exists' do
    before { create(:health_body_weight) }

    it { is_expected.to be_falsey }
  end
end
