# frozen_string_literal: true

module My
  module Learning
    class BooksController < BaseController
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
          @book = resource.new(resource_params)
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
          @book = resource.new(resource_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: resource_params)
      end

      def resource_params
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
