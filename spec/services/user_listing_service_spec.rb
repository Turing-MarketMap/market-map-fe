require 'rails_helper'

RSpec.describe 'User Listing Service' do
  # before(:each) {
  #   users_json = "{\"data\":{\"id\":\"1\",\"type\":\"user\",\"attributes\":{\"first_name\":\"eldridge\",\"last_name\":\"turambi\",\"email\":\"eturambi@gmail.com\"}}}"
  #
  #   stub_request(:post, "http://localhost:3000/api/v1/users/listings").with(query: { 'user_id' => 5, 'listing_id' => 12, 'user[last_name]' => 'turambi'}).to_return(status: 200, body: users_json, headers: {})
  #
  #   stub_request(:delete, "http://localhost:3000/api/v1/users/1").to_return(status: 204, headers: {})
  # }

  describe '::create_user_listing', :vcr do
    it 'returns correct json' do
      user =  UserService.find_user('eturambi@gmail.com', 'eldridge', 'turambi')
      response = UserListingService.create_user_listing(user[:data][:id], 2)

      expect(response).to eq({:message=>"Saved listing for user."})
    end
  end

  describe '::delete_user_listing', :vcr do
    it 'returns correct json' do
      user =  UserService.find_user('eturambi@gmail.com', 'eldridge', 'turambi')
      UserListingService.create_user_listing(user[:data][:id], 2)
      response = UserListingService.delete_user_listing(user[:data][:id], 2)
      # binding.pry
      expect(response.status).to eq(204)
    end
  end
end
