# frozen_string_literal: true

module Shared
  module Utils
    class Container
      extend Dry::Container::Mixin

      register('normalizer') { Normalizer.new }
    end
  end
end
