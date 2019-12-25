# frozen_string_literal: true

module Shared
  module Utils
    class Normalizer
      def normalize_url(url)
        url.to_s.strip
      end

      def normalize_title(title)
        title.to_s.delete("\n").gsub(/\s+/, ' ').strip
      end

      def remove_extra_whitespaces(value)
        value.to_s.delete("\n").gsub(/\s+/, ' ').strip
      end
    end
  end
end
