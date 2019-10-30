# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'addressable'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '>= 4.3.1'
gem 'devise'
gem 'devise_zxcvbn'
gem 'dotenv-rails'
gem 'dry-system'
gem 'font-awesome-rails'
gem 'hiredis'
gem 'jquery-rails'
gem 'mini_racer', platforms: :ruby
gem 'pg'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'
gem 'redis-session-store'
gem 'rollbar'
gem 'sanitize'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'slim-rails'
gem 'sprockets'
gem 'validate_url'

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
