class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= session[:auth_hash].deep_symbolize_keys! if session[:auth_hash]
  end
end
