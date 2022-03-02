class SessionsController < ApplicationController
  def create
    session[:auth_hash] = request.env['omniauth.auth']
    binding.pry
    user = UserService.find_user('fake@gmail.com', 'name1', 'last_name1')
    session[:user_id] = user[:data][:id]

    redirect_to root_path
  end

  def destroy
    session.delete(:auth_hash)
    @current_user = nil
    
    redirect_to root_path
  end
end
