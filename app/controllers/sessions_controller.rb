class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = 'Successfully signed in'
      sign_in user
      session[:id] = user.id
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'home/index'
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end
end
