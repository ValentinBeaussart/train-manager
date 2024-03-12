module Api
  module V1
    class DestinationsController < ApplicationController
      # GET /destinations
      def index
        render json: Destination.all
      end

      # POST /destinations
      def create
        @destination = Destination.new(destination_params)

        if @destination.save
          render json: @destination, status: :created, location: @destination
        else
          render json: @destination.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /destinations/1
      def update
        if @destination.update(destination_params)
          render json: @destination
        else
          render json: @destination.errors, status: :unprocessable_entity
        end
      end

      # DELETE /destinations/1
      def destroy
        @destination.destroy!
      end
    end
  end
end
