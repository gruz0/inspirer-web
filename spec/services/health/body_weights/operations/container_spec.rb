# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Health::BodyWeights::Operations::Container do
  subject(:container) { described_class }

  it 'has assign_attributes operation' do
    expect(container['assign_attributes']).to be_instance_of(Health::BodyWeights::Operations::AssignAttributes)
  end
end
