# frozen_string_literal: true

class AppContainer
  extend Dry::Container::Mixin

  register 'redis' do
    Redis.current
  end
end

Import = Dry::AutoInject(AppContainer)
