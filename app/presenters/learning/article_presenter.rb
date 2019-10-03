# frozen_string_literal: true

module Learning
  class ArticlePresenter
    include ActionView::Helpers::UrlHelper

    attr_reader :article

    def initialize(article)
      @article = article
    end

    def clickable_title
      link_to(title, article.url, target: '_blank', rel: 'noreferrer nofollow noopener')
    end

    private

    def title
      article.title.present? ? article.title : article.url
    end
  end
end
