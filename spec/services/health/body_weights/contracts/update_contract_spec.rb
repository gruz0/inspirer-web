# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyWeights::Contracts::UpdateContract do
  let(:input) do
    {
      attributes: {
        weight: '98,15',
        unit: 'kg',
        feeling: 'good'
      }
    }
  end

  include_examples 'it validates contract'
end
