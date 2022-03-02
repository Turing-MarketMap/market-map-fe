class DashboardController < ApplicationController
  def index
    if session[:auth_hash]
      current_user
    end

    @listings = ListingFacade.get_listings(search_params)
    if @listings != []
      @data = ListingFacade.data_hash(@listings)
    end
  end

  private

  def search_params
    if params.keys.include? :search_params
      params[:search_params]
    else
      search_params = {min_year: 2000, max_year: 2015, make: 'Subaru', model: "Outback"}
    end
  end

end
