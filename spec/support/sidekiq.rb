# frozen_string_literal: true

require 'sidekiq/testing'

Sidekiq::Testing.inline!

RSpec.configure do |config|
  config.before { Sidekiq::Worker.clear_all }
end
