# frozen_string_literal: true

module My
  module Learning
    class ArticlesController < BaseController
      def index
        @articles = current_account.learning_article.order(created_at: :desc)
      end

      def new; end
    end
  end
end
