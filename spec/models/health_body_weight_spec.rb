# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthBodyWeight, type: :model do
  subject(:model) { build_stubbed(:health_body_weight) }

  it_behaves_like 'it sanitizes notes'
end
