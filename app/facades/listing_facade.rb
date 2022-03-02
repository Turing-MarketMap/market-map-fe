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

end
