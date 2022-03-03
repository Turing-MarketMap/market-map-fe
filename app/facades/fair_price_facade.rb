class FairPriceFacade
  class << self

    def get_fair_price(model, mileages)
      response = FairPriceService.get_fair_price(model, mileages)
      json = JSON.parse(response.body, symbolize_names: true)
      json[:data][:attributes][:predictions].map{ |prediction| prediction.to_i }
    end

  end
end
