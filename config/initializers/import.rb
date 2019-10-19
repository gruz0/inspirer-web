# frozen_string_literal: true

class AppContainer
  extend Dry::Container::Mixin
end

Import = Dry::AutoInject(AppContainer)
