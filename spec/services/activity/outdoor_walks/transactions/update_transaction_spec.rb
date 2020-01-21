# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::OutdoorWalks::Transactions::UpdateTransaction do
  let(:expected_steps) do
    {
      validate: 'shared.validate',
      must_be_created_once_per_day: 'shared.must_be_created_once_per_day',
      assign_attributes: 'assign_attributes',
      persist: 'shared.persist'
    }
  end

  include_examples 'it validates transaction steps'
end
