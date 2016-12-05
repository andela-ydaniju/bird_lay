module SessionHandler
  def sign_in(user)
    session[:user_id] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def login_required!
    redirect_to root_url unless signed_in?
    flash.now[:notice] = 'You need to be signed in'
  end
end
