class Listings
  attr_reader :listings

  def initialize(listings)
    @listings = listings
  end

  def all_makes
    makes = @listings.map do |listing|
      listing.make
    end
    makes.uniq!
  end

  def all_models(make)
    listings_of_make = listings.select do |listing|
      listing.make == make
    end
    models = listings_of_make.map {|listing| listing.model}.sort
    models.uniq!
  end
end
