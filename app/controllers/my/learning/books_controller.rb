# frozen_string_literal: true

module My
  module Learning
    class BooksController < BaseController
      include Import[service: 'learning.books.service']

      def index
        super
      end

      def show
        super
      end

      def new
        super
      end

      def create
        super { my_learning_books_path }
      end

      def edit
        super
      end

      def update
        super { my_learning_books_path }
      end

      private

      def resource_params
        params.require(:learning_book)
              .permit(:title, :author, :url, :status, :feeling, :notes, :created_at)
              .to_h.symbolize_keys
      end

      def resource_class
        current_account.learning_book
      end
    end
  end
end
