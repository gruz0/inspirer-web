# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'addressable'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap', '>= 4.5.2'
gem 'devise', '>= 4.7.3'
gem 'devise_zxcvbn', '>= 5.2.0'
gem 'dotenv-rails', '>= 2.7.6'
gem 'dry-system'
gem 'dry-transaction'
gem 'dry-validation'
gem 'flatpickr'
gem 'font-awesome-rails', '>= 4.7.0.6'
gem 'hiredis'
gem 'jquery-rails', '>= 4.5.0'
gem 'pagy'
gem 'pg'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.1.7', '>= 6.1.7.5'
gem 'redis-session-store', '>= 0.11.3'
gem 'rollbar'
gem 'sanitize'
gem 'sassc-rails'
gem 'sidekiq'
gem 'slim-rails', '>= 3.3.0'
gem 'sprockets'
gem 'validate_url', '>= 1.0.12'

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
  gem 'web-console', '>= 4.0.4'
end

group :development, :test do
  gem 'rspec-rails', '~> 4.0', '>= 4.0.2'
end

group :test do
  gem 'capybara', require: 'capybara/rspec'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '>= 6.1.0'
  gem 'ffaker'
  gem 'selenium-webdriver'
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers', '>= 4.4.0'
end
