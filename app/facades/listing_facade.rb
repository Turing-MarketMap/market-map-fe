class ListingFacade
  def self.get_listings(query)
    json = ListingService.get_listings(query)
  end

end
