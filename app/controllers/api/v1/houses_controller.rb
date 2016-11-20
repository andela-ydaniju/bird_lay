module Api
  module V1
    class HousesController < ApplicationController
      def index
        render json: 'Welcome', status: 200
      end
    end
  end
end
