# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Sleeps::Schemas::SleepSchema do
  subject(:result) { described_class.call(input) }

  let(:input) do
    {
      attributes: {
        woke_up_at_hour: woke_up_at_hour,
        woke_up_at_minutes: woke_up_at_minutes,
        feeling: feeling
      }
    }
  end
  let(:woke_up_at_hour) { 7 }
  let(:woke_up_at_minutes) { 15 }
  let(:feeling) { 'good' }

  it { is_expected.to be_success }

  %i[woke_up_at_hour woke_up_at_minutes].each { |key| include_examples 'it validates integer', key }

  context 'when woke_up_at_hour is out of bound' do
    let(:woke_up_at_hour) { 24 }

    it { is_expected.to be_failure }
  end

  context 'when woke_up_at_minutes is out of bound' do
    let(:woke_up_at_minutes) { 60 }

    it { is_expected.to be_failure }
  end

  include_examples 'it validates enum', :feeling
end
