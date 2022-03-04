class UserListingService

  def self.connection
    Faraday.new(url: ENV['consultancy_be'])
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_user_listing(user_id, listing_id)
    response = connection.post("users/#{user_id}/listings") do |req|
      req.params['user_id'] = user_id
      req.params['listing_id'] = listing_id
    end
    parse_json(response)
  end

  def self.delete_user_listing(user_id, listing_id)
    connection.delete("users/#{user_id}/listings/#{listing_id}")
  end

end
