require 'rails_helper'

RSpec.describe 'Listings poro' do
  let!(:listings_object) { build(:listings, listing_count: 3) }

  it "exists" do
    expect(listings_object).to be_a(Listings)
  end

  it "has a collection of listing objects" do
    expect(listings_object.listings).to be_a(Array)
    expect(listings_object.listings.sample(1)[0]).to be_a(Listing)
  end
end
