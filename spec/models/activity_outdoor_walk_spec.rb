# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivityOutdoorWalk, type: :model do
  subject(:model) { build_stubbed(:activity_outdoor_walk) }

  it_behaves_like 'it sanitizes notes'
end
