require 'rails_helper'

RSpec.describe 'FairPriceFacade' do
  context 'good request' do
    let!(:name) {'Impreza'}
    let!(:mileage) { [10000,50000] }

    it "returns expected data" do
      VCR.insert_cassette('fair_price_facade') do
        data = FairPriceFacade.get_fair_price(name, mileage)
        expect(data).to be_a(Array)
        sample = data.sample(1)[0]
        expect(sample).to be_a(Hash)
        expect(sample.keys).to eq([:odometer, :sellingprice])
        expect(sample[:odometer]).to be_a(Integer)
        expect(sample[:sellingprice]).to be_a(Integer)
      end
    end
  end

end
