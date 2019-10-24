# frozen_string_literal: true

require 'dry/system/container'

class Container < Dry::System::Container
  configure do |config|
    config.root = (Pathname.pwd + 'app')
    config.auto_register = %w[services]
  end

  load_paths!('services')
end

Import = Container.injector
