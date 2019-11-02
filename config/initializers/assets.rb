# frozen_string_literal: true

Rails.application.config do |config|
  config.assets.configure do |env|
    env.register_mime_type('application/manifest+json', extensions: ['.webmanifest'])
  end
end

Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
