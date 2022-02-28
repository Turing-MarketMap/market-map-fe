class DashboardController < ApplicationController
  def index
    @listings = ListingFacade.get_listings(:q)

    # If session[:user_id].nil? == false
    ## UserService.find_user(session[:email])
  end
end
