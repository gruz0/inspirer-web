# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Books::Transactions::UpdateTransaction do
  let(:expected_steps) do
    {
      validate: 'shared.validate',
      check_url_uniqueness: 'shared.check_url_uniqueness',
      assign_attributes: 'assign_attributes',
      persist: 'shared.persist'
    }
  end

  include_examples 'it validates transaction steps'
end
