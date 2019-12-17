# frozen_string_literal: true

module Shared
  module Utils
    class Sanitizer
      def sanitize_html(content)
        Sanitize.new(remove_contents: true).fragment(content.to_s).strip
      end
    end
  end
end
