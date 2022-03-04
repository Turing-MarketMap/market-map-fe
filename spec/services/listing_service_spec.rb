require 'rails_helper'

RSpec.describe 'listing service' do
  context 'when listings exist' do
    context 'class methods', :vcr do
      describe 'conn' do
        it 'can return listings hash' do
          listing = ListingService.conn
          expect(listing).to be_a(Faraday::Connection)
        end
      end

      describe '.get listings' do
        it 'can ______' do
          query = {}
          query[:min_year] = 2000
          query[:max_year] = 2010
          query[:make] = "Subaru"
          query[:model] = "Impreza"
          listing = ListingService.get_listings(query)
          expect(listing).to be_a(Hash)
          expect(listing[:data]).to be_a(Array)
          expect(listing[:data][0][:attributes]).to have_key(:year)
          expect(listing[:data][0][:attributes]).to have_key(:make)
          expect(listing[:data][0][:attributes]).to have_key(:model)
          expect(listing[:data][0][:attributes]).to have_key(:trim)
          expect(listing[:data][0][:attributes]).to have_key(:body)
          expect(listing[:data][0][:attributes]).to have_key(:transmission)
          expect(listing[:data][0][:attributes]).to have_key(:vin)
          expect(listing[:data][0][:attributes]).to have_key(:state)
          expect(listing[:data][0][:attributes]).to have_key(:condition)
          expect(listing[:data][0][:attributes]).to have_key(:odometer)
          expect(listing[:data][0][:attributes]).to have_key(:color)
          expect(listing[:data][0][:attributes]).to have_key(:interior)
          expect(listing[:data][0][:attributes]).to have_key(:sellingprice)
        end
      end
    end
  end

  it 'gets listings given user id', :vcr do
    # json_response = File.read('spec/fixtures/user_listings_given_user_id.json')
    json_body = "{\"data\":[{\"id\":\"3900\",\"type\":\"listing\",\"attributes\":{\"year\":2019,\"make\":\"Audi\",\"model\":\"A4\",\"trim\":\"XL\",\"body\":\"Cargo Van\",\"transmission\":\"CVT\",\"vin\":\"3RLGLK247RIU45602\",\"state\":\"DE\",\"condition\":1.14,\"odometer\":69615,\"color\":\"Beige\",\"interior\":\"Sit aspernatur aut porro.\",\"sellingprice\":11719}},{\"id\":\"3901\",\"type\":\"listing\",\"attributes\":{\"year\":2013,\"make\":\"Chevy\",\"model\":\"Silverado\",\"trim\":\"ESi\",\"body\":\"Sedan\",\"transmission\":\"Automanual\",\"vin\":\"35AOE1VBJI0768454\",\"state\":\"ND\",\"condition\":3.74,\"odometer\":207221,\"color\":\"Orange\",\"interior\":\"Perferendis saepe ut quos.\",\"sellingprice\":36857}},{\"id\":\"3902\",\"type\":\"listing\",\"attributes\":{\"year\":2017,\"make\":\"Dodge\",\"model\":\"Challenger\",\"trim\":\"XLE\",\"body\":\"Passenger Van\",\"transmission\":\"Automatic\",\"vin\":\"21VN2P5P46EW95516\",\"state\":\"TN\",\"condition\":4.07,\"odometer\":248733,\"color\":\"Beige\",\"interior\":\"Ut minima delectus qui.\",\"sellingprice\":23207}},{\"id\":\"3903\",\"type\":\"listing\",\"attributes\":{\"year\":2019,\"make\":\"Ford\",\"model\":\"Mustang\",\"trim\":\"L\",\"body\":\"Minivan\",\"transmission\":\"Manual\",\"vin\":\"2EKO3C8Q2OXU03372\",\"state\":\"AL\",\"condition\":2.27,\"odometer\":132240,\"color\":\"Grey\",\"interior\":\"Eaque ut sed nemo.\",\"sellingprice\":34891}}]}"

    stub_request(:get, "http://localhost:3000/api/v1/users/1/listings").to_return(status: 200, body: json_body, headers: {})

    user_listings = ListingService.listings_by_user_id(1)
    expect(user_listings).to be_a(Hash)
    expect(user_listings[:data]).to be_a(Array)
    expect(user_listings[:data][0][:attributes][:year]).to be_an(Integer)
    expect(user_listings[:data][0][:attributes][:make]).to be_an(String)
    expect(user_listings[:data][0][:attributes][:model]).to be_an(String)
    expect(user_listings[:data][0][:attributes][:make]).to eq('Audi')
    expect(user_listings[:data][0][:attributes][:model]).to eq('A4')
  end
end
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


# {
#   "data":[
#     {
#     "id":"420",
#     "type":"listing",
#     "attributes":{
#       "year":"2015",
#       "make":"Honda",
#       "model":"Accord",
#       "trim":"test movie",
#       "body":"test movie",
#       "transmission":"test movie",
#       "vin":"test movie",
#       "state":"test movie",
#       "condition":"good",
#       "odometer":"120000",
#       "color":"test movie",
#       "interior":"test movie",
#       "selling_price":"test movie",
#       "title":"test movie"
#     },
#     {
#     "id":"421",
#     "type":"listing",
#     "attributes":{
#       "year":"2012",
#       "make":"Kia",
#       "model":"Sorento",
#       "trim":"test movie",
#       "body":"test movie",
#       "transmission":"test movie",
#       "vin":"test movie",
#       "state":"Colorado",
#       "condition":"test movie",
#       "odometer":"100000",
#       "color":"test movie",
#       "interior":"test movie",
#       "selling_price":"test movie",
#       "title":"test movie"
#     },
#     {
#     "id":"422",
#     "type":"listing",
#     "attributes":{
#       "year":"2013",
#       "make":"Ford",
#       "model":"Focus",
#       "trim":"test movie",
#       "body":"test movie",
#       "transmission":"test movie",
#       "vin":"test movie",
#       "state":"Colorado",
#       "condition":"test movie",
#       "odometer":"100000",
#       "color":"test movie",
#       "interior":"test movie",
#       "selling_price":"test movie",
#       "title":"test movie"
#     },
#     {
#     "id":"423",
#     "type":"listing",
#     "attributes":{
#       "year":"2016",
#       "make":"Toyota",
#       "model":"Tacoma",
#       "trim":"test movie",
#       "body":"test movie",
#       "transmission":"test movie",
#       "vin":"test movie",
#       "state":"Colorado",
#       "condition":"test movie",
#       "odometer":"100000",
#       "color":"test movie",
#       "interior":"test movie",
#       "selling_price":"test movie",
#       "title":"test movie"
#     }]
# }
