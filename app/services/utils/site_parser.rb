# frozen_string_literal: true

module Utils
  class SiteParser
    def parse(html)
      @document = Nokogiri::HTML.parse(html)

      self
    end

    def title
      @document.title.presence
    end

    def h1
      tags = @document.css('h1')
      return if tags.empty?

      tags.first.text.presence
    end

    private

    attr_reader :document
  end
end
