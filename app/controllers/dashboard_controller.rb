class DashboardController < ApplicationController
  before_action :current_user
  before_action :search_params, only: [:index]

  def index
    @listings = ListingFacade.get_listings(session[:search_params])

    if @listings != []
      @data = ListingFacade.data_hash(@listings)
    end
  end

  private

  # Ensure default params are passed to populate scatterplot when user first arrives, before they click "search"
  def search_params
    if params.keys.include? "search_params"
      search_params = params['search_params'].permit(:make, :model, :min_year, :max_year)
      #params['search_params'].permit(:make, :model, :min_year, :max_year, :min_price, :max_price, :min_mileage, :max_mileage)
    else
      search_params = {min_year: 2000, max_year: 2015, make: 'Subaru', model: "Outback"}
    end

    formatted_search_params = search_params.to_h.symbolize_keys
    session[:search_params] = formatted_search_params
  end
end
