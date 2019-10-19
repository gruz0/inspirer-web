# frozen_string_literal: true

module Normalizers
  extend ActiveSupport::Concern

  included do
    private

    def normalize_url
      return unless url

      self.url = url.downcase.strip
    end

    def normalize_title
      return unless title

      self.title = title.strip
    end
  end
end
