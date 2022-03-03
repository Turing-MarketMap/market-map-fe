class UserService

  class << self

    def connection
      Faraday.new(url: ENV['consultancy_be'])
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def find_user(email, first_name, last_name)
      response = connection.post("users") do |faraday|
        faraday.params['user[email]'] = email
        faraday.params['user[first_name]'] = first_name
        faraday.params['user[last_name]'] = last_name
      end
      parse_json(response)
    end

    def delete_account(user_id)
      response = connection.delete("users/#{user_id}")
      parse_json(response)
    end


    # def find_user(email)#(email)
    #
    #   response = connection.get("users")
    #   binding.pry
    #
    #   json_response = parse_json(response)
    #
    #   if json_response[:data].first[:attributes][:email] == email
    #   end
    # end

  end
end
