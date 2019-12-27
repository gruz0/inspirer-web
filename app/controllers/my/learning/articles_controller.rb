# frozen_string_literal: true

module My
  module Learning
    class ArticlesController < BaseController
      ACTION_MAP = {
        create: :create,
        update: :update
      }.freeze

      include Import[service: 'learning.articles.service']

      def index
        @articles = current_account.learning_article.order(created_at: :desc)
      end

      def new
        @article = current_account.learning_article.new
      end

      def create
        if result.success?
          redirect_to my_learning_articles_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @article = current_account.learning_article.new(article_params)
          render :new
        end
      end

      def edit
        @article = resource
      end

      def update
        if result.success?
          redirect_to my_learning_articles_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @article = current_account.learning_article.new(article_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: article_params)
      end

      def action
        ACTION_MAP[params[:action].to_sym]
      end

      def article_params
        params.require(:learning_article).permit(:url, :title, :feeling, :notes).to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.learning_article.find(params[:id])
        else
          current_account.learning_article
        end
      end
    end
  end
end
