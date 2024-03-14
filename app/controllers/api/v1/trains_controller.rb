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

      def create # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
        available_platform = available_platform(train_params[:departure_time], train_params[:destination_id])

        if available_platform.nil?
          render json: { error: 'Il faut respecter un minimum de 10 minutes entre deux utilisations d’un même quai' },
                 status: :unprocessable_entity
          return
        end

        @train = Train.new(train_params.merge(station_platform: available_platform))
        if @train.departure_time >= @train.arrival_time
          render json: { error: "L'heure de départ doit être postérieure à l'heure d'arrivée" },
                 status: :unprocessable_entity
          return
        end

        if @train.save
          render json: @train, status: :created
        else
          render json: @train.errors, status: :unprocessable_entity
        end
      end

      # DELETE /trains
      def destroy
        @train = Train.find_by(id: params[:id])

        if @train.destroy
          head :no_content
        else
          render json: @train.errors, status: :unprocessable_entity
        end
      end

      private

      def train_params
        params.require(:train).permit(:station_platform, :arrival_time, :departure_time, :destination_id)
      end

      def available_platform(departure_time, destination_id) # rubocop:disable Metrics/MethodLength
        destination = Destination.find_by(id: destination_id)
        return nil if destination.nil?

        destination_category = destination.category

        available_platforms = if destination_category == 'TER'
                                %w[A B C D E]
                              else
                                %w[D E]
                              end

        available_platforms.shuffle.each do |platform|
          conflicting_train = Train.find_by(station_platform: platform)
          next if conflicting_train && (conflicting_train.arrival_time + 10.minutes) > departure_time

          return platform
        end

        nil
      end
    end
  end
end
