require 'rails_helper'

RSpec.describe 'listing_facade' do
  it 'makes Listing poros', :vcr do
    listing = ListingFacade.get_listing_by_id(1)
    expect(listing.make).to be_a(String)
    expect(listing.model).to be_a(String)
    expect(listing.year).to be_a(Integer)
  end

  context 'class methods' do
    describe 'data_hash' do
      context 'listings exist' do
        it "returns all the listings objects as an array of their data_hashes" do
          listings = build_list(:listing, 5)

          expect(ListingFacade.data_hash(listings)).to be_a(Array)
          expect(ListingFacade.data_hash(listings).sample(1)[0]).to be_a(Hash)
          expect(ListingFacade.data_hash(listings).sample(1)[0].keys).to eq([:id,
                                                                            :year,
                                                                            :make,
                                                                            :model,
                                                                            :trim,
                                                                            :body,
                                                                            :transmission,
                                                                            :vin,
                                                                            :state,
                                                                            :condition,
                                                                            :odometer,
                                                                            :color,
                                                                            :interior,
                                                                            :selling_price,
                                                                            :title])
        end
      end
      context 'listings do not exist' do
        it "returns an empty array" do
          expect(ListingFacade.data_hash([])).to eq(nil)
        end
      end
    end
  end
end
