# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'addressable'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap', '>= 4.3.1'
gem 'devise'
gem 'devise_zxcvbn'
gem 'dotenv-rails'
gem 'dry-system'
gem 'dry-transaction'
gem 'dry-validation'
gem 'flatpickr'
gem 'font-awesome-rails'
gem 'hiredis'
gem 'jquery-rails'
gem 'pagy'
gem 'pg'
gem 'puma', '~> 4.3', '>= 4.3.3'
# FIXME: It should be updated to '~> 6.0.3' after fixing Zeitwerk's issue
gem 'rails', '= 6.0.1'
gem 'redis-session-store'
gem 'rollbar'
gem 'sanitize'
gem 'sassc-rails'
gem 'sidekiq'
gem 'slim-rails'
gem 'sprockets'
gem 'validate_url'

# NOTE: When we'll try to build this Docker image for production,
# we'll have this issue when try to install mini_racer with v8 on Alpine Linux:
# LoadError: Error relocating /usr/local/bundle/gems/mini_racer-0.2.6/lib/mini_racer_extension.so:
# backtrace_symbols: symbol not found - /usr/local/bundle/gems/mini_racer-0.2.6/lib/mini_racer_extension.so
#
# To fix this we need to use ruby-slim image instead of alpine :-(
# Alexander Kadyrov, 2019-11-05
group :production do
  gem 'mini_racer'
end

group :development do
  gem 'active_record_query_trace'
  gem 'better_errors'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.9'
end

group :test do
  gem 'capybara', require: 'capybara/rspec'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'selenium-webdriver'
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers'
end
