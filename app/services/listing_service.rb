class ListingService
  class << self

    def conn
      url = ENV['consultancy_be']
      Faraday.new(url: url)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_listings(query)
      search_query = Hash.new
      search_query[:min_year] = query[:min_year]
      search_query[:max_year] = query[:max_year]
      search_query[:make] = query[:make]
      search_query[:model] = query[:model]
      response = conn.get('listings/search') do|req|
          req.params['search_params'] = search_query
      end
      
      parse_json(response)
    end

    def get_listing_by_id(id)
      response = conn.get("listings/#{id}")
      parse_json(response)
    end

    def listings_by_user_id(id)
      response = conn.get("users/#{id}/listings")
      parse_json(response)
    end

  # def self.get_url(url)
  #   root = 'https://api/v1'
  #   root += "/#{url}"
  # end

  end
end
