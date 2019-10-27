# frozen_string_literal: true

module Utils
  class SiteParser
    def call(url)
      raise ArgumentError, 'URL could not be empty' if url.blank?

      file        = open_url(url)
      document    = download_page(file)
      parsed_page = parse_page(document)

      build_response(url, parsed_page)
    end

    private

    def open_url(url)
      URI.open(Addressable::URI.parse(url).normalize)
    end

    def download_page(file)
      File.read(file)
    end

    def parse_page(document)
      Nokogiri::HTML::DocumentFragment.parse(document)
    end

    def build_response(url, html)
      page_title = send(default_tag(url), html)

      raise StandardError, 'Could not find TITLE and H1 on the page' if page_title.blank?

      {
        title: page_title
      }
    end

    def default_tag(url)
      provider_detector.detect!(url).default_tag
    end

    def provider_detector
      @provider_detector ||= ProviderDetector.new
    end

    def title(document)
      document.css('title').text.presence
    end

    def h1(document)
      value = document.css('h1')
                      .reject { |tag| tag.text.blank? }
                      .map { |tag| tag.text.strip }
                      .first

      value || title(document)
    end
  end
end
