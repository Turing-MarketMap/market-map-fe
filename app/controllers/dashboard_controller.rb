class DashboardController < ApplicationController
  def index
    if session[:auth_hash]
      current_user
    end

    @listings = ListingFacade.get_listings(search_params.to_h.symbolize_keys)
    if @listings != []
      @data = ListingFacade.data_hash(@listings)
    end
  end

  private

  # Ensure default params are passed to populate scatterplot when user first arrives, before they click "search"
  def search_params
    if params.keys.include? "search_params"
      params['search_params'].permit(:make, :model, :min_year, :max_year)
      #params['search_params'].permit(:make, :model, :min_year, :max_year, :min_price, :max_price, :min_mileage, :max_mileage)
    else
      search_params = {min_year: 2000, max_year: 2015, make: 'Subaru', model: "Outback"}
    end
  end

end
