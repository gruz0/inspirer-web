# frozen_string_literal: true

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raises error for missing translations
  config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.web_console.whitelisted_ips = ['10.0.0.0/8', '172.16.0.0/12', '192.168.0.0/16']

  config.active_storage.service = :local

  config.assets.digest = false
  config.assets.debug = false

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: ENV.fetch('MAILER_HOST') }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV.fetch('MAILER_SERVER'),
    domain: ENV.fetch('MAILER_DOMAIN'),
    port: ENV.fetch('MAILER_PORT'),
    user_name: ENV.fetch('MAILER_USER_NAME'),
    password: ENV.fetch('MAILER_PASSWORD'),
    authentication: 'login',
    enable_starttls_auto: true
  }
end
