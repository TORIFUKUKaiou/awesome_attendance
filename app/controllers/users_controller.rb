class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def show
    @user = User.find(params[:id])
  end

  private

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
