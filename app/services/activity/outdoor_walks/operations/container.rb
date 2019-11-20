# frozen_string_literal: true

module Activity
  module OutdoorWalks
    module Operations
      class Container
        extend Dry::Container::Mixin
        import Shared::Container

        register('build') { Build.new }
        register('assign_attributes') { AssignAttributes.new }
        register('persist') { Persist.new }
      end
    end
  end
end
