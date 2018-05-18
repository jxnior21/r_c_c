module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json

      def index
        render :json => Event.all
      end

      def show
        render :json => Event.find(params[:id])
      end

      def create
        render :json => Event.create(params[:event])
      end

      def update
        render :json => Event.update(params[:id], params[:event])
      end

      def destroy
        render :json => Event.destroy(params[:id])
      end

    end
  end
end
