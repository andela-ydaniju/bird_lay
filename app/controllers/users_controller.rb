class UsersController < ApplicationController
  before_action :login_required!
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to dashboard_path
    else
      render :new
      flash[:error] = 'Error occured'
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    render 'users/dashboard'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :level)
  end
end
