class HomeController < ApplicationController
  def index
    render 'users/dashboard' if current_user
  end

  def missing
    render(:file => "#{Rails.root}/public/404.html", status: 404)
  end
end
