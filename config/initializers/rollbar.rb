# frozen_string_literal: true

Container.boot(:rollbar) do |container|
  init do
    Rollbar.configure do |config|
      config.environment = Rails.env
      config.disable_rack_monkey_patch = true
      config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']
      config.enabled = false unless Rails.env.production?

      # @see https://docs.rollbar.com/docs/ruby#section-person-tracking
      config.person_method = 'current_account'
      config.person_id_method = 'id'
      config.person_email_method = 'email'
      config.person_username_method = 'username'

      # @see https://docs.rollbar.com/docs/ruby#section-code-and-context
      config.send_extra_frame_data = :app

      # @see https://docs.rollbar.com/docs/sidekiq-integration
      config.use_sidekiq
    end

    container.register('rollbar', Rollbar)
  end
end

Container.resolve('rollbar')
