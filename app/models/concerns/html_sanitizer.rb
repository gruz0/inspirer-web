# frozen_string_literal: true

module HTMLSanitizer
  extend ActiveSupport::Concern

  included do
    private

    def sanitize_html(value)
      sanitize_fragment(value)
    end
  end
end
