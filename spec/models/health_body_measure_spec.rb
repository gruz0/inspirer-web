# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthBodyMeasure, type: :model do
  subject(:model) { build_stubbed(:health_body_measure) }

  it_behaves_like 'it sanitizes notes'
end
