class ListingFacade
  def self.get_listings(query)
    json = ListingService.get_listings(query)
    json[:data].map do |listing|
      Listing.new(listing[:attributes])
    end
  end

  def self.data_hash(listings)
    if listings != []
      return listings.map { |listing| listing.data_hash }
    end
  end

  def self.get_listing_by_id(id)
    listing_data = ListingService.get_listing_by_id(id)[:data][:attributes]
    Listing.new(listing_data)
  end

end
