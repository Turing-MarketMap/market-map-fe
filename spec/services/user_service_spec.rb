require 'rails_helper'

RSpec.describe UserService do
  # before :each do
  #   users_json = "{\"data\":{\"id\":\"1\",\"type\":\"user\",\"attributes\":{\"first_name\":\"eldridge\",\"last_name\":\"turambi\",\"email\":\"eturambi@gmail.com\"}}}"
  #
  #   stub_request(:post, "http://localhost:3000/api/v1/users").with(query: { 'user[email]' => 'eturambi@gmail.com', 'user[first_name]' => 'eldridge', 'user[last_name]' => 'turambi'}).to_return(status: 200, body: users_json, headers: {})
  #
  # end

  it 'can get user from params', :vcr do


    user =  UserService.find_user('eturambi@gmail.com', 'eldridge', 'turambi')
    expect(user[:data][:attributes][:email]).to eq('eturambi@gmail.com')
    expect(user[:data][:attributes][:first_name]).to eq('eldridge')
    expect(user[:data][:attributes][:last_name]).to eq('turambi')
  end

  xit 'can destroy a users account', :vcr do
    user = UserService.find_user('eturambi@gmail.com', 'eldridge', 'turambi')
    json = UserService.delete_account(user[:data][:id])
    binding.pry
    expect(response.status).to eq(204)
  end
end
