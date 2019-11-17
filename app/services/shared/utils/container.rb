# frozen_string_literal: true

require 'dry-container'

module Shared
  module Utils
    class Container
      extend Dry::Container::Mixin

      register('html_sanitizer') { HTMLSanitizer.new }
    end
  end
end
