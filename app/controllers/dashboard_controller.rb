class DashboardController < ApplicationController
  def index
    @listings = ListingFacade.get_listings(params)
  end

end
