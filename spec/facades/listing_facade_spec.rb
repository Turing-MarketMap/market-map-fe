require 'rails_helper'

RSpec.describe 'listing_facade' do
  context 'class methods' do
    describe 'data_hash' do
      it "returns all the object parameters formatted as a hash" do
        listing_data = {
                        id: 1,
                        year: 2015,
                        make: "Honda",
                        model: "Civic",
                        trim: "LX",
                        body: "sedan",
                        transmission: "automatic",
                        vin: "19xfb2f58ce307205",
                        state: "ca",
                        condition: 2.6,
                        odometer: 73995,
                        color: "gray",
                        interior: "gray",
                        sellingPrice: 8900,
                        title: '2015 Honda Civic'
                       }
        listing = Listing.new(listing_data)

        expect(listing.data_hash).to be_a(Hash)
        expect(listing.data_hash.keys).to eq([:id,
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
                                              :sellingPrice,
                                              :title])
        expect(listing.data_hash).to eq(listing_data)
      end
    end
  end
end
