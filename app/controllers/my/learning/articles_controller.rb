# frozen_string_literal: true

module My
  module Learning
    class ArticlesController < BaseController
      def index
        @articles = current_account.learning_article.order(created_at: :desc)
      end

      def new
        @article = current_account.learning_article.new
      end

      def create
        @article = current_account.learning_article.new(article_params)

        if @article.save
          FetchLinkTitleWorker.perform_async(@article.class, @article.id, @article.url) if @article.title.blank?

          redirect_to my_learning_articles_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      def edit
        @article = resource
      end

      def update
        @article = resource
        if @article.update(article_params)
          FetchLinkTitleWorker.perform_async(@article.class, @article.id, @article.url) if @article.title.blank?

          redirect_to my_learning_articles_path, notice: 'Record was successfully updated'
        else
          render :edit
        end
      end

      private

      def article_params
        params.require(:learning_article).permit(:url, :title, :feeling, :notes)
      end

      def resource
        current_account.learning_article.find(params[:id])
      end
    end
  end
end
