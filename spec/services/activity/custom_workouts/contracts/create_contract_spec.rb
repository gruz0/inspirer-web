# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity::CustomWorkouts::Contracts::CreateContract do
  let(:input) do
    {
      attributes: {
        title: 'My Workout',
        feeling: 'good'
      }
    }
  end

  include_examples 'it validates contract'
end
