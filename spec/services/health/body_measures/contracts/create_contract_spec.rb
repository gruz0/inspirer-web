# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::BodyMeasures::Contracts::CreateContract do
  let(:input) do
    {
      attributes: {
        chest: '90,35',
        hips: '65,15',
        waist: '89,91',
        unit: 'cm',
        feeling: 'good'
      }
    }
  end

  include_examples 'it validates contract'
end
