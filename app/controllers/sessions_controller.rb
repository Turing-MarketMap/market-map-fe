class SessionsController < ApplicationController
  def create
    session[:auth_hash] = request.env['omniauth.auth']
    redirect_to root_path
  end

  def destroy
    session.delete(:auth_hash)
    @current_user = nil
    
    redirect_to root_path
  end
end
