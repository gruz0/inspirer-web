# frozen_string_literal: true

module My
  module Learning
    class BooksController < BaseController
      include Import[service: 'learning.books.service']

      def index
        @records = resource.order(created_at: :desc)
      end

      def new
        @record = resource.new
      end

      def create
        if result.success?
          redirect_to my_learning_books_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @record = resource_class.new(resource_params)
          render :new
        end
      end

      def edit
        @record = resource
      end

      def update
        if result.success?
          redirect_to my_learning_books_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @record = resource_class.new(resource_params)
          render :edit
        end
      end

      private

      def resource_params
        params.require(:learning_book).permit(:title, :author, :url, :status, :feeling, :notes).to_h.symbolize_keys
      end

      def resource_class
        current_account.learning_book
      end
    end
  end
end
