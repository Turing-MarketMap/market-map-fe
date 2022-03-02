class ListingService

  def self.conn
    url = 'http://localhost:3000/api/v1/'
    Faraday.new(url: url)
  end

  def self.get_listings(query)
    search_query = Hash.new
    search_query[:min_year] = query[:min_year]
    search_query[:max_year] = query[:max_year]
    search_query[:make] = query[:make]
    search_query[:model] = query[:model]
    response = conn.get('listings/search') do|req|
      req.params['search_params'] = search_query
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  # def self.get_url(url)
  #   root = 'https://api/v1'
  #   root += "/#{url}"
  # end


end
