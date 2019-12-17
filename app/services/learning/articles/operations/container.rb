# frozen_string_literal: true

module Learning
  module Articles
    module Operations
      class Container
        extend Dry::Container::Mixin
        import Shared::Container

        register('check_url_uniqueness') { CheckURLUniqueness.new }
        register('assign_attributes') { AssignAttributes.new }
      end
    end
  end
end
