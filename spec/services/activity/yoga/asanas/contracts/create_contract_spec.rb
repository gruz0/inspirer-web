# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::Yoga::Asanas::Contracts::CreateContract do
  let(:input) do
    {
      attributes: {
        notes: 'Asana',
        feeling: 'good'
      }
    }
  end

  include_examples 'it validates contract'
end
