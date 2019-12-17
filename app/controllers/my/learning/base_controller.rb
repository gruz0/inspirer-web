# frozen_string_literal: true

module My
  module Learning
    class BaseController < ApplicationController
      private

      def fetch_link_title(resource)
        return if resource.title.present?

        FetchLinkTitleWorker.perform_async(resource.class, resource.id, resource.url)
      end
    end
  end
end
