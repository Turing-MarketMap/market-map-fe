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

      it 'makes Listing poros', :vcr do
        json_body = "{\"data\":[{\"id\":\"3900\",\"type\":\"listing\",\"attributes\":{\"year\":2019,\"make\":\"Audi\",\"model\":\"A4\",\"trim\":\"XL\",\"body\":\"Cargo Van\",\"transmission\":\"CVT\",\"vin\":\"3RLGLK247RIU45602\",\"state\":\"DE\",\"condition\":1.14,\"odometer\":69615,\"color\":\"Beige\",\"interior\":\"Sit aspernatur aut porro.\",\"sellingprice\":11719}},{\"id\":\"3901\",\"type\":\"listing\",\"attributes\":{\"year\":2013,\"make\":\"Chevy\",\"model\":\"Silverado\",\"trim\":\"ESi\",\"body\":\"Sedan\",\"transmission\":\"Automanual\",\"vin\":\"35AOE1VBJI0768454\",\"state\":\"ND\",\"condition\":3.74,\"odometer\":207221,\"color\":\"Orange\",\"interior\":\"Perferendis saepe ut quos.\",\"sellingprice\":36857}},{\"id\":\"3902\",\"type\":\"listing\",\"attributes\":{\"year\":2017,\"make\":\"Dodge\",\"model\":\"Challenger\",\"trim\":\"XLE\",\"body\":\"Passenger Van\",\"transmission\":\"Automatic\",\"vin\":\"21VN2P5P46EW95516\",\"state\":\"TN\",\"condition\":4.07,\"odometer\":248733,\"color\":\"Beige\",\"interior\":\"Ut minima delectus qui.\",\"sellingprice\":23207}},{\"id\":\"3903\",\"type\":\"listing\",\"attributes\":{\"year\":2019,\"make\":\"Ford\",\"model\":\"Mustang\",\"trim\":\"L\",\"body\":\"Minivan\",\"transmission\":\"Manual\",\"vin\":\"2EKO3C8Q2OXU03372\",\"state\":\"AL\",\"condition\":2.27,\"odometer\":132240,\"color\":\"Grey\",\"interior\":\"Eaque ut sed nemo.\",\"sellingprice\":34891}}]}"

        stub_request(:get, "http://localhost:3000/api/v1/users/1/listings").to_return(status: 200, body: json_body, headers: {})

        poro_listings_array = ListingFacade.listings_by_user_id(1)
        expect(poro_listings_array.count).to eq(4)

        poro_listings_array.each do |listing|
          expect(listing).to be_an_instance_of(Listing)
          expect(listing.make).to be_a(String)
          expect(listing.model).to be_a(String)
          expect(listing.year).to be_an(Integer)
        end
      end 
    end
  end
end
