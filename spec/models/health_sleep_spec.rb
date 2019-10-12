# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthSleep, type: :model do
  subject(:model) { build_stubbed(:health_sleep) }

  it_behaves_like 'it sanitizes notes'
end
