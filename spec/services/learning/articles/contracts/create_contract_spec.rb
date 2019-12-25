# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Learning::Articles::Contracts::CreateContract do
  let(:input) do
    {
      attributes: {
        url: 'https://example.com/123',
        feeling: 'good'
      }
    }
  end

  include_examples 'it validates contract'

  include_examples 'it validates url_format'
end
