require 'rails_helper'

RSpec.describe 'User Service' do
  before :each do

  end

  it 'can get all users' do

    users_json = "{\"data\":{\"id\":\"1\",\"type\":\"user\",\"attributes\":{\"first_name\":\"eldridge\",\"last_name\":\"turambi\",\"email\":\"eturambi@gmail.com\"}}}"

    stub_request(:post, "http://localhost:3000/api/v1/users").with(query: { 'user[first_name]' => 'jackson', 'user[last_name]' => 'valdez', 'user[email]' => 'jvaldez@gmail.com'}).to_return(status: 200, body: users_json, headers: {})

    user =  UserService.find_user('eturambi@gmail.com')
    expect(user[:email]).to eq('eturambi@gmail.com')
  end
end
