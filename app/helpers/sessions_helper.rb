module SessionsHelper
  #Logs in user
  def log_in(user)
    session[:user_id] = user.id
  end
  #returns the current logged-in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  #checks if user is looged in
  def logged_in?
    !current_user.nil?
  end
  #logs user out
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in_user
    if !logged_in?
      flash[:danger] = "Sign in to perform this action"
      redirect_to login_path
    end

  end

  def already_logged_in
    if logged_in?
      redirect_to todos_path
    end
  end

end
