require 'rails_helper'

RSpec.describe ListingFacade do

  it 'makes Listing poros', :vcr do
    listing = ListingFacade.get_listing_by_id(1)
    expect(listing.make).to be_a(String)
    expect(listing.model).to be_a(String)
    expect(listing.year).to be_a(Integer)
  end
end
