class ListingService
  class << self

    def connection
      Faraday.new(url: "http://localhost:3000/api/v1/")
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def find_listing(make, model)
      response = connection.get("listings/search") do |faraday|
        faraday.params['listing[make]'] = make
        faraday.params['listing[model]'] = model
      end
      parse_json(response)
    end

    def get_url(url)

    end
  end
end
