# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Sleeps::Transactions::CreateTransaction do
  let(:expected_steps) do
    {
      must_be_created_once_per_day: 'shared.must_be_created_once_per_day',
      validate: 'shared.validate',
      build: 'shared.build',
      assign_attributes: 'assign_attributes',
      persist: 'shared.persist'
    }
  end

  include_examples 'it validates transaction steps'
end
