# frozen_string_literal: true

module Learning
  class BookPresenter
    include ActionView::Helpers::UrlHelper

    attr_reader :book

    def initialize(book)
      @book = book
    end

    def clickable_title
      return sanitized_title if book.url.blank?

      link_to(sanitized_title, book.url, target: '_blank', rel: 'noreferrer nofollow noopener')
    end

    private

    def sanitized_title
      @sanitized_title ||= sanitize_fragment(book.title)
    end
  end
end
