class ListingFacade
  def self.get_listings(query)
    json = ListingService.get_listings(query)
  end

  def self.get_listing_by_id(id)
    listing_data = ListingService.get_listing_by_id(id)[:data][:attributes]
    Listing.new(listing_data)
  end

  def self.listings_by_user_id(id)
    listing_data = ListingService.listings_by_user_id(id)
    listing_poros = []

    listing_data[:data].each do |listing|
      listing_poros << Listing.new(listing[:attributes])
    end
    listing_poros
  end
end
