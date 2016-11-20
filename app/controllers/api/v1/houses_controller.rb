module Api
  module V1
    class HousesController < ApplicationController
      def index
        houses = House.all

        render json: houses, status: 200
      end

      def show
        house = House.find_by(id: params[:id])

        render json: house, status: 200
      end
    end
  end
end
