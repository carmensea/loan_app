class UsersController < ApplicationController
  before_action :require_no_user, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      if @user.admin?
        redirect_to '/uploads'
      else
        redirect_to '/'
      end
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                  :password_confirmation)
    end

    def require_no_user
      redirect_to uploads_path if logged_in? && is_admin?
      redirect_to root_path if logged_in? && !is_admin?
    end


end
