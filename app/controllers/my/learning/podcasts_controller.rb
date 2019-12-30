# frozen_string_literal: true

module My
  module Learning
    class PodcastsController < BaseController
      include Import[service: 'learning.podcasts.service']

      def index
        @podcasts = resource.order(created_at: :desc)
      end

      def new
        @podcast = resource.new
      end

      def create
        if result.success?
          redirect_to my_learning_podcasts_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @podcast = resource_class.new(resource_params)
          render :new
        end
      end

      def edit
        @podcast = resource
      end

      def update
        if result.success?
          redirect_to my_learning_podcasts_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @podcast = resource_class.new(resource_params)
          render :edit
        end
      end

      private

      def resource_params
        params.require(:learning_podcast).permit(:url, :title, :feeling, :notes).to_h.symbolize_keys
      end

      def resource_class
        current_account.learning_podcast
      end
    end
  end
end
