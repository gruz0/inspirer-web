# frozen_string_literal: true

require 'rails_helper'
require 'dry/transaction/operation'

RSpec.describe Activity::Yoga::Asanas::Operations::Container do
  subject(:container) { described_class }

  it 'has assign_attributes operation' do
    expect(container['assign_attributes']).to be_instance_of(Activity::Yoga::Asanas::Operations::AssignAttributes)
  end
end
