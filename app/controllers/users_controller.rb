class UsersController < ApplicationController

  def index
    user = UserService.find_user(email)
  end

  def new

  end
end
