class ListingsController < ApplicationController
  def show
    # @listing = Listing.new(listing_params)
    @listing = ListingFacade.get_listing_by_id(params[:id])
    @image = ImageFacade.search_for_listing_image(@listing.title, @listing.color)
  end


  private

  def listing_params
    params.require(:listing).permit(
                                    :id,
                                    :year,
                                    :make,
                                    :model,
                                    :trim,
                                    :body,
                                    :transmission,
                                    :vin,
                                    :state,
                                    :condition,
                                    :odometer,
                                    :color,
                                    :interior,
                                    :selling_price,
                                    :title
                                   )
  end
end
