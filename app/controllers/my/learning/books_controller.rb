# frozen_string_literal: true

module My
  module Learning
    class BooksController < BaseController
      ACTION_MAP = {
        create: :create,
        update: :update
      }.freeze

      include Import[service: 'learning.books.service']

      def index
        @books = resource.order(created_at: :desc)
      end

      def new
        @book = resource.new
      end

      def create
        if result.success?
          redirect_to my_learning_books_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @book = resource.new(book_params)
          render :new
        end
      end

      def edit
        @book = resource
      end

      def update
        if result.success?
          redirect_to my_learning_books_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @book = resource.new(book_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: book_params)
      end

      def action
        ACTION_MAP[params[:action].to_sym]
      end

      def book_params
        params.require(:learning_book).permit(:title, :author, :url, :status, :feeling, :notes).to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.learning_book.find(params[:id])
        else
          current_account.learning_book
        end
      end
    end
  end
end
