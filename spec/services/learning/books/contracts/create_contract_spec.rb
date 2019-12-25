# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Books::Contracts::CreateContract do
  let(:input) do
    {
      attributes: {
        title: 'My Book',
        status: 'new_book',
        feeling: 'good'
      }
    }
  end

  include_examples 'it validates contract'

  include_examples 'it validates url_format'
end
