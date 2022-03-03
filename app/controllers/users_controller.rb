class UsersController < ApplicationController

  def index
    user = UserFacade.find_user(email)
  end

  def new

  end

  def destroy
    UserService.delete_account(session[:user_id])
    
    redirect_to logout_path
  end

  def show
    if session[:auth_hash] == nil
      redirect_to '/'
      flash[:alert] = "Please login to see user profile information"
    end

  end
end
