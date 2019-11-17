# frozen_string_literal: true

module Shared
  module Utils
    class HTMLSanitizer
      def call(input)
        sanitize.fragment(input.to_s).strip
      end

      private

      def sanitize
        @sanitize ||= Sanitize.new(remove_contents: true)
      end
    end
  end
end
