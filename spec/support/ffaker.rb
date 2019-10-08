# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:all) do
    FFaker::Random.seed = config.seed
  end

  config.before do
    FFaker::Random.reset!
  end
end
