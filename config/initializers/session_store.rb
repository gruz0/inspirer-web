# frozen_string_literal: true

return if Rails.env.test?

Rails.application.config.session_store(
  :redis_session_store,
  key: ENV.fetch('COOKIE_SESSION_KEY'),
  domain: :all,
  httponly: false,
  serializer: :json,
  redis: {
    driver: :hiredis,
    key_prefix: ENV.fetch('REDIS_SESSION_KEY_PREFIX'),
    url: ENV.fetch('REDIS_SESSION_URL')
  }
)
