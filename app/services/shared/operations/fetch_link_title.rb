# frozen_string_literal: true

require 'dry/monads/all'

module Shared
  module Operations
    class FetchLinkTitle < BaseOperation
      include Dry::Monads

      def call(input)
        resource = input[:resource]

        FetchLinkTitleWorker.perform_async(resource.class, resource.id, resource.url) if resource.title.blank?

        Success input
      end
    end
  end
end
