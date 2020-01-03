# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::Running::Transactions::CreateTransaction do
  let(:expected_steps) do
    {
      validate: 'shared.validate',
      build: 'shared.build',
      assign_attributes: 'assign_attributes',
      persist: 'shared.persist'
    }
  end

  include_examples 'it validates transaction steps'
end
