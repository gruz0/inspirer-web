# frozen_string_literal: true

module Learning
  class VideoPresenter
    include ActionView::Helpers::UrlHelper

    attr_reader :video

    def initialize(video)
      @video = video
    end

    def clickable_title
      link_to(title, video.url, target: '_blank', rel: 'noreferrer nofollow noopener')
    end

    private

    def title
      sanitized_title = sanitize_fragment(video.title)
      sanitized_title.presence || video.url
    end
  end
end
