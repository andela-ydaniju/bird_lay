module Api
  module V1
    class HousesController < ApplicationController
      def index
        houses = House.all

        render json: houses, status: :ok
      end

      def show
        house = House.find_by(id: params[:id])

        if house
          render json: house, status: :ok
        else
          render status: :not_found
        end
      end

      def create
        house = House.new(house_params)

        if house.save
          render json: house, status: :created
        else
          render json: house.errors, status: :unprocessable_entity
        end
      end

      def update
        house = House.find_by(id: params[:id])
        house.update_attributes(house_params)

        if house.save
          render json: house, status: :no_content
        else
          render json: house.errors, status: :unprocessable_entity
        end
      end

      def destroy
        house = House.find_by(id: params[:id])

        if house && house.destroy
          render json: house, status: :no_content
        else
          render status: :not_found
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
