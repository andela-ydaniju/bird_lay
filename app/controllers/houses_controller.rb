class HousesController < ApplicationController
  before_action :login_required!
  def new
    @house = current_user.houses.new
  end
end
