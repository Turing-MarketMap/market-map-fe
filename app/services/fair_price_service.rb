class FairPriceService
  class << self

    def conn
      url = 'http://localhost:3000/api/v1/'
      Faraday.new(url: url)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_fair_price(model, mileages)
      query = "fair_price?model=#{model}"
      mileages.each do |mileage|
        query += "&mileage[]=#{mileage}"
      end
      response = conn.get(query)
    end
  end
end
