# frozen_string_literal: true

Container.boot(:sidekiq) do |container|
  init do
    use :redis

    Sidekiq.configure_server do |config|
      config.redis = container['redis']
    end

    Sidekiq.configure_client do |config|
      config.redis = container['redis']
    end
  end
end
