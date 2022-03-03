class SessionsController < ApplicationController
  def create
    session[:auth_hash] = request.env['omniauth.auth']
    current_user
    user = UserService.find_user(@current_user[:email], @current_user[:first_name], @current_user[:last_name])
    session[:auth_hash]['info']['user_id'] = user[:data][:id]

    redirect_to root_path
  end

  def destroy
    session.delete(:auth_hash)
    @current_user = nil
    
    redirect_to root_path
  end
end
