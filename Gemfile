# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'addressable', '>= 2.8.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap', '>= 4.5.0'
gem 'devise'
gem 'devise_zxcvbn'
gem 'dotenv-rails', '>= 2.7.6'
gem 'dry-system'
gem 'dry-transaction'
gem 'dry-validation'
gem 'flatpickr'
gem 'font-awesome-rails', '>= 4.7.0.6'
gem 'hiredis'
gem 'jquery-rails'
gem 'pagy'
gem 'pg'
gem 'puma', '~> 4.3', '>= 4.3.12'
gem 'rails', '~> 6.1.7', '>= 6.1.7.3'
gem 'redis-session-store'
gem 'rollbar'
gem 'sanitize', '>= 6.0.1'
gem 'sassc-rails'
gem 'sidekiq', '>= 7.0.0'
gem 'slim-rails'
gem 'sprockets', '>= 4.2.0'
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
  gem 'better_errors', '>= 2.8.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 4.0.3'
end

group :development, :test do
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
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
