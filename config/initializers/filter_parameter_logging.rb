# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [
  :password,
  # An API
  :access_token, :refresh_token,
  # Devise
  :confirmation_token
]
