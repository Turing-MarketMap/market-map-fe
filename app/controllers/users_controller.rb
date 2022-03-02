class UsersController < ApplicationController

  def index
    user = UserFacade.find_user(email)
  end

  def new

  end

  def login
    user = UserService.find_user('fake@gmail.com', 'name1', 'last_name1')
    session[:user_id] = user[:data][:id]
    redirect_to root_path
  end
end
