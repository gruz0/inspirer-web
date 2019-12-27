# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Podcasts::Transactions::UpdateTransaction do
  let(:expected_steps) do
    {
      validate: 'shared.validate',
      check_url_uniqueness: 'shared.check_url_uniqueness',
      assign_attributes: 'assign_attributes',
      persist: 'shared.persist',
      fetch_link_title: 'shared.fetch_link_title'
    }
  end

  include_examples 'it validates transaction steps'
end
