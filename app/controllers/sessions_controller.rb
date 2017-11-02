class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to '/uploads'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      p "you are here"
      log_in(user)
      redirect_to '/uploads'
    else
      @errors = ["Invalid email/password combination"]
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
