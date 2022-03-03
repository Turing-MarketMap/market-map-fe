class FairPriceFacade
  class << self

    def get_fair_price(model, mileages)
      response = FairPriceService.get_fair_price(model, mileages)
      json = JSON.parse(response.body, symbolize_names: true)
      predictions = json[:data][:attributes][:predictions].map{ |prediction| prediction.to_i }
      data_array = []
      predictions.each_with_index do |prediction, i|
        data_hash = {}
        data_hash[:odometer] = mileages[i]
        data_hash[:sellingprice] = prediction
        data_array << data_hash
      end
      data_array
    end

  end
end
