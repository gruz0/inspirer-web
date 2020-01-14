# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Meditations::Transactions::UpdateTransaction do
  let(:expected_steps) do
    {
      validate: 'shared.validate',
      assign_attributes: 'assign_attributes',
      persist: 'shared.persist'
    }
  end

  include_examples 'it validates transaction steps'
end
