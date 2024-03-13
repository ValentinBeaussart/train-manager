# frozen_string_literal: true

module Api
  module V1
    class TrainsController < ApplicationController # rubocop:disable Style/Documentation
      # GET /trains
      def index # rubocop:disable Metrics/MethodLength
        trains = Train.includes(:destination)
                      .order(departure_time: :asc)
                      .limit(10)
                      .map do |train|
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
      def create # rubocop:disable Metrics/MethodLength
        @train = Train.new(train_params)
        if @train.departure_time >= @train.arrival_time
          render json: { error: "L'heure de départ doit être postérieure à l'heure d'arrivée" },
                 status: :unprocessable_entity
          return
        end

        destination = Destination.find_by(id: train_params[:destination_id])
        destination_category = destination.category
        assign_platform(destination_category)

        if @train.save
          render json: @train, status: :created
        else
          render json: @train.errors, status: :unprocessable_entity
        end
      end

      # DELETE /destinations/1
      def destroy # rubocop:disable Metrics/MethodLength
        @train = Train.find_by(id: params[:id])
        @train_platform = @train.station_platform
        destination = Destination.find(@train.destination_id)
        destination_category = destination.category
        @train.destroy
        reassign_platform(destination_category) if @train_platform.present?

        if @train.destroy
          head :no_content
        else
          render json: @train.errors, status: :unprocessable_entity
        end
      end

      private

      def reassign_platform(destination_category)
        compatible_trains_without_platform = Train.where(station_platform: '').all
        compatible_trains_without_platform.each do |train|
          destination_category = train.destination.category
          available_platform = available_platform(destination_category)

          if available_platform.present?
            train.update(station_platform: available_platform)
            break
          end
        end
      end

      def train_params
        params.require(:train).permit(:station_platform, :arrival_time, :departure_time, :destination_id)
      end

      def assign_platform(destination_category)
        station_platform = available_platform(destination_category)
        @train.station_platform = station_platform if station_platform.present?
        @train.save
      end

      def available_platform(destination_category)
        if destination_category == 'TER'
          %w[A B C D E].find { |platform| Train.where(station_platform: platform).empty? }
        else
          %w[D E].find { |platform| Train.where(station_platform: platform).empty? }
        end
      end
    end
  end
end
