# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyWeights::Transactions::CreateTransaction do
  let(:expected_steps) do
    {
      validate: 'shared.validate',
      build: 'shared.build',
      must_be_created_once_per_day: 'shared.must_be_created_once_per_day',
      assign_attributes: 'assign_attributes',
      persist: 'shared.persist'
    }
  end

  include_examples 'it validates transaction steps'
end
