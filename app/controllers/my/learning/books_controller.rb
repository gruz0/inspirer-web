# frozen_string_literal: true

module My
  module Learning
    class BooksController < BaseController
      def index
        @books = current_account.learning_book.order(created_at: :desc)
      end

      def new
        @book = current_account.learning_book.new
      end

      def create
        @book = current_account.learning_book.new(book_params)

        if @book.save
          redirect_to my_learning_books_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      private

      def book_params
        params.require(:learning_book).permit(:title, :author, :url, :status, :feeling, :notes)
      end
    end
  end
end
