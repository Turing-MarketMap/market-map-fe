class DashboardController < ApplicationController
  def index
    if session[:auth_hash]
      current_user
    end
    @listings = ListingFacade.get_listings(params)
  end

end
