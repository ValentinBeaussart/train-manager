module Api
  module V1
    class TrainsController < ApplicationController
      # GET /trains
      def index
        render json: Train.all
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
        @train.destroy!
      end
    end
  end
end
