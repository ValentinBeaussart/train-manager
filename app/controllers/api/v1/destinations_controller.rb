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
          render json: @destination, status: :created
        else
          render json: @destination.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /destinations/1
      def update
        @destination = Destination.find(params[:id])
        if @destination.update(destination_params)
          render json: @destination
        else
          render json: @destination.errors, status: :unprocessable_entity
        end
      end

      # DELETE /trains
      def destroy
        @destination = Destination.find_by(id: params[:id])

        if @destination.destroy
          head :no_content
        else
          render json: @destination.errors, status: :unprocessable_entity
        end
      end

      private

      def destination_params
        params.require(:destination).permit(:station_code, :category, :name)
      end
    end
  end
end
