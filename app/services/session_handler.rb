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
    return if signed_in?

    render(file: "#{Rails.root}/public/404.html", status: 404)
  end
end
