class DashboardController < ApplicationController
  def index
    if session[:auth_hash]
      current_user
    end
    @listings = ListingFacade.get_listings(:q)
  end
end
