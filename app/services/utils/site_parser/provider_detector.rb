# frozen_string_literal: true

module Utils
  class SiteParser
    class ProviderDetector
      def detect!(url)
        raise ArgumentError, 'URL could not be empty' if url.blank?

        find_provider_by_domain(url)
      end

      private

      def find_provider_by_domain(url)
        if ['youtube.com', 'youtu.be'].any? { |domain| url.include?(domain) }
          YoutubeProvider.new
        else
          DefaultProvider.new
        end
      end
    end
  end
end
