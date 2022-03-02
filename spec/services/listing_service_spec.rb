require 'rails_helper'

RSpec.describe 'listing service' do
  context 'when listings exist' do
    context 'get makes with no other parameters set' do

      # allow(ListingService).to receive(:get_makes).and_return({data: ["A", "B", "C", "D", "E"]})

      # let!(:make_response) { ListingService.get_makes }
      # let!(:json) { JSON.parse(make_response.body, symbolize_names: true) }


      xit "returns correct https status " do
        expect(make_response).to have_http_status(200)
      end

      xit "returns the expected json" do
        expect(json).to be_a(Hash)
        expect(json).to have_key(:data)
        expect(json[:data]).to be_a(Array)
        expect(json[:data]).to eq(["A", "B", "C", "D", "E"])
      end
    end

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
end
