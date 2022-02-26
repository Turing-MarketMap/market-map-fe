class DashboardsController < ApplicationController
  def index
    @listings = ListingFacade.get_listings(:q)
  end
end
