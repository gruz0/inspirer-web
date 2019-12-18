# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::OutdoorWalks::Transactions::CreateTransaction do
  subject(:transaction) { described_class.new }

  let(:steps) { transaction.steps.map { |step| [step.name, step.operation_name] }.to_h }
  let(:expected_steps) do
    {
      must_be_created_once_per_day: 'shared.must_be_created_once_per_day',
      validate: 'shared.validate',
      build: 'shared.build',
      assign_attributes: 'assign_attributes',
      persist: 'shared.persist'
    }
  end

  it 'has required steps' do
    expect(steps).to eq(expected_steps)
  end
end
