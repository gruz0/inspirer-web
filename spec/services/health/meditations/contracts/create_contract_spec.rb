# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Meditations::Contracts::CreateContract do
  let(:input) do
    {
      attributes: {
        notes: 'Meditation',
        feeling: 'good'
      }
    }
  end

  include_examples 'it validates contract'
end
