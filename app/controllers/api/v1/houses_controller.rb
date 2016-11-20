module Api
  module V1
    class HousesController < ApplicationController
      def index
        houses = House.all

        render json: houses, status: :ok
      end

      def show
        house = House.find_by(id: params[:id])

        render json: house, status: :ok
      end

      def create
        house = House.new(house_params)

        if house.save
          render json: house, status: :created
        else
          render json: house.errors, status: :unprocessable_entity
        end
      end

      private

      def house_params
        params.permit(
          :name, :code, :capacity, :stage, :admin_id
        )
      end
    end
  end
end
