# frozen_string_literal: true

module Normalizers
  extend ActiveSupport::Concern

  included do
    private

    def normalize_url
      return unless url

      self.url = url.strip
    end

    def normalize_title
      return unless title

      self.title = title.delete("\n").gsub(/\s+/, ' ').strip
    end
  end
end
