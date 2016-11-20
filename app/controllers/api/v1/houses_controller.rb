module Api
  module V1
    class HousesController < ApplicationController
      def index
        houses = House.all

        render json: houses, status: 200
      end
    end
  end
end
