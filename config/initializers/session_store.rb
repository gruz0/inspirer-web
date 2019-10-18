# frozen_string_literal: true

Rails.application.config.session_store :cache_store, key: ENV.fetch('COOKIE_SESSION_KEY')
