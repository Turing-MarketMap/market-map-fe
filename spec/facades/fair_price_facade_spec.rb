require 'rails_helper'

RSpec.describe 'FairPriceFacade' do
  context 'good request' do
    let!(:name) {'Impreza'}
    let!(:mileage) { [10000,50000] }

    it "returns expected data", :vcr do
      data = FairPriceFacade.get_fair_price(name, mileage)
      expect(data).to be_a(Array)
      expect(data.count).to eq(2)
      expect(data.sample(1)[0]).to be_a(Integer)
    end
  end

end
