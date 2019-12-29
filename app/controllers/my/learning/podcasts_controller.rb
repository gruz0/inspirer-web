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
          @podcast = resource.new(podcast_params)
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
          @podcast = resource.new(podcast_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: podcast_params)
      end

      def podcast_params
        params.require(:learning_podcast).permit(:url, :title, :feeling, :notes).to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.learning_podcast.find(params[:id])
        else
          current_account.learning_podcast
        end
      end
    end
  end
end
