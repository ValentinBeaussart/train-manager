# frozen_string_literal: true

module Api
  module V1
    class TrainsController < ApplicationController # rubocop:disable Style/Documentation
      # GET /trains
      def index # rubocop:disable Metrics/MethodLength
        trains = Train.includes(:destination).all.map do |train|
          {
            id: train.id,
            station_platform: train.station_platform,
            arrival_time: train.arrival_time,
            departure_time: train.departure_time,
            destination_id: train.destination_id,
            destination_name: train.destination.name
          }
        end

        render json: trains
      end

      # POST /trains
      def create
        @train = Train.new(train_params)

        if @train.save
          render json: @train, status: :created, location: @train
        else
          render json: @train.errors, status: :unprocessable_entity
        end
      end

      # DELETE /trains/1
      def destroy
        @train = Train.find_by(id: params[:id])
        @train.destroy
      end

      private

      def train_params
        params.require(:train).permit(:destination_id, :platform, :arrival_time, :departure_time, :destination_id,
                                      :destination_name)
      end
    end
  end
end
