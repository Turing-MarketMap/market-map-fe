require 'rails_helper'

RSpec.describe ListingService do


  ##Supposed to get listing based on filter params(Big One) && one based on listing id


#   it 'can get listing based on id', :vcr do
#
#     listing_json = "{\"data\":[{\"id\":\"2092\",\"type\":\"listing\",\"attributes\":{\"year\":2001,\"make\":\"Toyota\",\"model\":\"Camry\",\"trim\":\"ESi\",\"body\":\"Hatchback\",\"transmission\":\"Manual\",\"vin\":\"0XZYK6N14YA209760\",\"state\":\"WY\",\"condition\":2.83,\"odometer\":64746,\"color\":\"Blue\",\"interior\":\"Odio minima modi omnis.\",\"sellingprice\":29407}}]}"
#
#     stub_request(:get, "http://localhost:3000/api/v1/listings/search").with(query: { 'listing[:make]' => 'Toyota', 'listing[:model]' => 'Camry'}).to_return(status: 200, body: listing_json, headers: {})
#
#
#
#     listing =  ListingService.find_listing('Toyota', 'Camry')
#     binding.pry
#     expect(listing[:data][:attributes][:id]).to eq(1)
#     expect(listing[:data][:attributes][:color]).to eq('color')
#     expect(listing[:data][:attributes][:drivetrain]).to eq('drivetrain')
#   end
end
























# require 'rails_helper'
#
# RSpec.describe 'listing service' do
#   context 'when listings exist' do
#     let!(:query_1) { {:listing,
#                     year: 2015,
#                     make: "Honda",
#                     model: "Civic",
#                     trim: "LX",
#                     body: "sedan",
#                     transmission: "automatic",
#                     vin: "19xfb2f58ce307205",
#                     state: "ca",
#                     condition: 2.6,
#                     odometer: 73995,
#                     color: "gray",
#                     interior: "gray",
#                     sellingPrice: 8900
#                     }
#     let!(:response_1) { ListingService.get_listings(query) }
#     let!(:json) { JSON.parse(response.body, symbolize_names: true }
#
#     context 'get makes with no other parameters set' do
#
#       allow(ListingService).to receive(:get_makes).and_return({data: ["A", "B", "C", "D", "E"]})
#
#       let!(:make_response) { ListingService.get_makes }
#       let!(:json) { JSON.parse(make_response.body, symbolize_names: true) }
#
#
#       it "returns correct https status " do
#         expect(make_response).to have_http_status(200)
#       end
#
#       it "returns the expected json" do
#         expect(json).to be_a(Hash)
#         expect(json).to have_key(:data)
#         expect(json[:data]).to be_a(Array)
#         expect(json[:data]).to eq(["A", "B", "C", "D", "E"])
#       end
#     end
#
#   end
#
# end
