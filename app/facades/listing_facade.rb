class ListingFacade
  def self.get_listings(query)
    json = ListingService.get_listings(query)
  end

  def self.data_hash(listings)
    if listings != []
      return listings.map { |listing| listing.data_hash }
    end
  end

end
