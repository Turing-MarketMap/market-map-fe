class ListingFacade
  def self.get_listings(query)
    json = ListingService.get_listings(query)
  end

  def self.get_listing_by_id(id)
    listing_data = ListingService.get_listing_by_id(id)[:data][:attributes]
    Listing.new(listing_data)
  end

end
