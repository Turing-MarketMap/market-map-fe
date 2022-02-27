require 'rails_helper'

RSpec.describe 'listing service' do
  context 'when listings exist' do
    # let!(:query_1) { {:listing,
    #                 year: 2015,
    #                 make: "Honda",
    #                 model: "Civic",
    #                 trim: "LX",
    #                 body: "sedan",
    #                 transmission: "automatic",
    #                 vin: "19xfb2f58ce307205",
    #                 state: "ca",
    #                 condition: 2.6,
    #                 odometer: 73995,
    #                 color: "gray",
    #                 interior: "gray",
    #                 sellingPrice: 8900
    #                 }
    # let!(:response_1) { ListingService.get_listings(query) }
    # let!(:json) { JSON.parse(response.body, symbolize_names: true }

    context 'get makes with no other parameters set' do

      allow(ListingService).to receive(:get_makes).and_return({data: ["A", "B", "C", "D", "E"]})

      let!(:make_response) { ListingService.get_makes }
      let!(:json) { JSON.parse(make_response.body, symbolize_names: true }


      it "returns correct https status " do
        expect(make_response).to have_http_status(200)
      end

      it "returns the expected json" do
        expect(json).to be_a(Hash)
        expect(json).to have_key(:data)
        expect(json[:data]).to be_a(Array)
        expect(json[:data]).to eq(["A", "B", "C", "D", "E"])
      end
    end

  end

end
