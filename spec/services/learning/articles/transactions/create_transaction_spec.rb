# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Articles::Transactions::CreateTransaction do
  subject(:transaction) { described_class.new }

  let(:steps) { transaction.steps.map { |step| [step.name, step.operation_name] }.to_h }
  let(:expected_steps) do
    {
      validate: 'shared.validate',
      build: 'shared.build',
      check_url_uniqueness: 'shared.check_url_uniqueness',
      assign_attributes: 'assign_attributes',
      persist: 'shared.persist'
    }
  end

  it 'has required steps' do
    expect(steps).to eq(expected_steps)
  end
end
