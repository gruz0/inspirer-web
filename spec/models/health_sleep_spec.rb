# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthSleep, type: :model do
  subject(:model) { build(:health_sleep) }

  # Account
  it { is_expected.to belong_to(:account) }

  # Woke up at hour
  it { is_expected.to validate_presence_of(:woke_up_at_hour) }

  it do
    # rubocop:disable RSpec/ImplicitSubject
    is_expected
      .to validate_numericality_of(:woke_up_at_hour)
      .only_integer
      .is_greater_than_or_equal_to(0)
      .is_less_than(24)
    # rubocop:enable RSpec/ImplicitSubject
  end

  # Woke up at minutes
  it { is_expected.to validate_presence_of(:woke_up_at_minutes) }

  it do
    # rubocop:disable RSpec/ImplicitSubject
    is_expected
      .to validate_numericality_of(:woke_up_at_minutes)
      .only_integer
      .is_greater_than_or_equal_to(0)
      .is_less_than(60)
    # rubocop:enable RSpec/ImplicitSubject
  end

  # Created at
  context 'when have another record for this day' do
    before do
      model.account = create(:health_sleep).account
      model.validate
    end

    it 'is invalid' do
      expect(model).to be_invalid
    end

    it 'has error' do
      expect(model.errors.messages[:created_date]).to include('should happen once per day')
    end
  end

  # Feeling
  it_behaves_like 'it validates feeling'

  # Notes
  it_behaves_like 'it sanitizes notes'
end
