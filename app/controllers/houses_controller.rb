class HousesController < ApplicationController
  before_action :login_required!
  def index
    @houses = House.all
  end

  def new
    @house = current_user.houses.new
  end

  def create
    @house = current_user.houses.new(house_params)

    if @house.save
      redirect_to house_path(@house.id)
    else
      render :new
    end
  end

  def show
    @house = House.find_by(id: params[:id])
  end

  private
  def house_params
    params.require(:house).permit(
      :name, :code, :capacity, :population, :feed_consumption
    )
  end
end
