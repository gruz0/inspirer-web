# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Health::Sleeps::Contracts::UpdateContract do
  let(:input) do
    {
      attributes: {
        woke_up_at_hour: 9,
        woke_up_at_minutes: 58,
        feeling: 'good'
      }
    }
  end

  include_examples 'it validates contract'
end
