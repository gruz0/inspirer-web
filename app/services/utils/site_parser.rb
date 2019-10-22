# frozen_string_literal: true

module Utils
  class SiteParser
    def call(url)
      raise ArgumentError, 'URL could not be empty' if url.blank?

      build_response(parse_page(url))
    end

    private

    def parse_page(url)
      Nokogiri::HTML.parse(open_url(url))
    end

    def open_url(url)
      URI.parse(url).open
    end

    def build_response(document)
      {
        title: title(document),
        h1: h1(document)
      }
    end

    def title(document)
      document.title.presence
    end

    def h1(document)
      tags = document.css('h1')
      return if tags.empty?

      tags.first.text.presence
    end
  end
end
