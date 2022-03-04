require 'rails_helper'

RSpec.describe 'fair_price service' do
  context 'good request' do
    let!(:name) {'Impreza'}
    let!(:mileage) { [10000,50000] }
    let!(:query) { "?model=#{name}&mileage[]=#{mileage[0]}&mileage[]=#{mileage[1]}" }

    describe 'conn', :vcr do
      it 'can create Faraday connection' do
        fair_price = FairPriceService.conn
        expect(fair_price).to be_a(Faraday::Connection)
      end
    end

    it "returns expected response", :vcr do
      response = FairPriceService.get_fair_price(name, mileage)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)

      data = json[:data]
      expect(data.keys).to eq([:id, :type, :attributes])
      expect(data[:attributes].keys).to eq([:predictions, :inputs])
      expect(data[:attributes][:inputs]).to eq(mileage)
      expect(data[:type]).to eq('fair_price_prediction')
      expect(data[:id]).to eq(name)
    end
  end
end
