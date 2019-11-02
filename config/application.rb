# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
# require "action_cable/engine"
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module InspirerApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.active_record.schema_format = :sql

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'controllers', '**', '*.yml').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'models', '**', '*.yml').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'views', '**', '*.yml').to_s]
    config.i18n.default_locale = :en

    config.cache_store = :redis_cache_store, { driver: :hiredis, url: ENV.fetch('REDIS_CACHE_URL') }

    # When assigning to a collection of attachments declared via `has_many_attached`, replace existing
    # attachments instead of appending. Use #attach to add new attachments without replacing existing ones.
    config.active_storage.replace_on_assign_to_many = true
  end
end
