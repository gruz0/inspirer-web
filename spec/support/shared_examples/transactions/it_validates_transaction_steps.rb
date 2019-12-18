# frozen_string_literal: true

RSpec.shared_examples 'it validates transaction steps' do
  subject(:transaction) { described_class.new }

  let(:steps) { transaction.steps.map { |step| [step.name, step.operation_name] }.to_h }

  it 'has required steps' do
    expect(steps).to eq(expected_steps)
  end
end
