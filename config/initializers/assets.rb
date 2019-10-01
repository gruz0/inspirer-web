# frozen_string_literal: true

Rails.application.config do |config|
  config.assets.configure do |env|
    env.register_mime_type('application/manifest+json', extensions: ['.webmanifest'])
  end
end
