class SessionsController < ApplicationController

  before_action :already_logged_in, only: [:new, :create]
  before_action :logged_in_user, only: [:destroy]

  def new
  end

  def create
    user  = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email and password combination'
      render 'new'
    end
  end

  def destroy
    log_out
  end
end
