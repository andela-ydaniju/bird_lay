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
    @mortality = Mortality.new

    redirect_to '/404.html' if @house.nil?
  end

  def register_mortality
    @house = House.find_by(id: params[:mortality][:house_id])
    @mortality = Mortality.new(
      registrar_id: current_user.id, house_id: @house.id,
      count: params[:mortality][:count], cause: params[:mortality][:cause]
    )

    if @mortality.save
      handler = MortalityHandler.new(@mortality.count, @house.id)
      if handler.remove_dead_birds!
        @house.save
        redirect_to house_path(params[:mortality][:house_id])
      end
    end
  end

  private

  def house_params
    params.require(:house).permit(
      :name, :code, :capacity, :population, :feed_consumption
    )
  end

  def mortality_params
    params.require(:mortality).permit(
      :cause, :count, :registrar_id, :house_id
    )
  end

end
