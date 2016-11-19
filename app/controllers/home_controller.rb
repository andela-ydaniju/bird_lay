class HomeController < ApplicationController
  def index
    render json: 'Welcome', status: 200
  end
end
