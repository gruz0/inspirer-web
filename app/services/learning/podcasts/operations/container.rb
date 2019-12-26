# frozen_string_literal: true

module Learning
  module Podcasts
    module Operations
      class Container
        extend Dry::Container::Mixin
        import Shared::Container

        register('assign_attributes') { AssignAttributes.new }
      end
    end
  end
end
