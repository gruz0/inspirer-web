# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindByCreatedToday do
  subject(:result) { described_class.new.call(Account) }

  context 'when records for this day already exist' do
    before { create(:account) }

    it { is_expected.to eq(Account.first) }
  end

  context 'when there are not records' do
    it { is_expected.to be_nil }
  end
end
