# frozen_string_literal: true

module Api
  module V1
    class TrainsController < ApplicationController
      # GET /trains
      def index # rubocop:disable Metrics/MethodLength
        trains = Train.includes(:destination).all.map do |train|
          {
            id: train.id,
            station_platform: train.station_platform,
            arrival_time: train.arrival_time.strftime('%H:%M'),
            departure_time: train.departure_time.strftime('%H:%M'),
            destination_id: train.destination_id,
            destination_name: train.destination.name
          }
        end

        render json: trains
      end

      # POST /trains
      def create
        @train = Train.new(train_params)
        destination = Destination.find_by(id: train_params[:destination_id])
        assign_platform(destination.category)

        if @train.save
          render json: @train, status: :created
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
        params.require(:train).permit(:station_platform, :arrival_time, :departure_time, :destination_id)
      end

      def assign_platform(destination_category)
        station_platform = available_platform(destination_category)
        @train.update(station_platform:) if station_platform
      end

      def available_platform(category)
        available_platforms = category == 'TER' ? %w[A B C] : %w[A B C D E]
        last_train = Train.where(station_platform: available_platforms).order(departure_time: :desc).first
        return unless last_train.nil? || (Time.now - last_train.departure_time) > 10.minutes

        available_platforms.find { |platform| Train.where(station_platform: platform).empty? }
      end
    end
  end
end
