# frozen_string_literal: true

module Health
  module Meditations
    module Operations
      class Container
        extend Dry::Container::Mixin
        import Shared::Container

        register('assign_attributes') { AssignAttributes.new }
      end
    end
  end
end
