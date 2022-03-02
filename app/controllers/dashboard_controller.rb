class DashboardController < ApplicationController
  def index
    if session[:auth_hash]
      current_user
    end

    @listings = ListingFacade.get_listings(params)

    if @listings[:data] != []
      @data = ListingFacade.data_hash(@listings)
    end
  end

end
