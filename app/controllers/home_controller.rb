class HomeController < ApplicationController
  def index
    render 'users/dashboard' if current_user
  end
end
