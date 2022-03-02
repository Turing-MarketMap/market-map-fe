class ListingFacade
  def self.get_listings(query)
    json = ListingService.get_listings(query)
  end

  def self.data_hash(listings)
    listings.map { |listing| listing.data_hash }
  end

end
