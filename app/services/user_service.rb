class UserService

  class << self

    def connection
      Faraday.new(url: "http://localhost:3000/api/v1/") 
      # JSON.parse(response.body, symbolize_names: true)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def all_users
      response = connection.get('/users')
      json_response = parse_json(response)
      json_response
    end
  end
end
