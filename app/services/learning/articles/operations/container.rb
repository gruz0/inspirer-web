# frozen_string_literal: true

module Learning
  module Articles
    module Operations
      class Container
        extend Dry::Container::Mixin
        import Shared::Container

        register('build') { Shared::Operations::Build.new }
        register('check_url_uniqueness') { CheckURLUniqueness.new }
        register('assign_attributes') { AssignAttributes.new }
        register('persist') { Shared::Operations::Persist.new }
      end
    end
  end
end
