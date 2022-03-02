class UsersController < ApplicationController

  def index
    user = UserFacade.find_user(email)
  end

  def new

  end

  def destroy
    UserService.delete_account(session[:user_id])
  end
end
