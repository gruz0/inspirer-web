# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::Running::Contracts::UpdateContract do
  let(:input) do
    {
      attributes: {
        distance_unit: 'km',
        distance: '5,34',
        feeling: 'good'
      }
    }
  end

  include_examples 'it validates contract'
end
