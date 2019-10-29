# frozen_string_literal: true

module Learning
  class PodcastPresenter
    include ActionView::Helpers::UrlHelper

    attr_reader :podcast

    def initialize(podcast)
      @podcast = podcast
    end

    def clickable_title
      link_to(title, podcast.url, target: '_blank', rel: 'noreferrer nofollow noopener')
    end

    private

    def title
      sanitized_title = sanitize_fragment(podcast.title)
      sanitized_title.presence || podcast.url
    end
  end
end
