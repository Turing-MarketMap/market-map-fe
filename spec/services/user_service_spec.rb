require 'rails_helper'

RSpec.describe UserService do
  before(:each) {
    users_json = "{\"data\":{\"id\":\"1\",\"type\":\"user\",\"attributes\":{\"first_name\":\"eldridge\",\"last_name\":\"turambi\",\"email\":\"eturambi@gmail.com\"}}}"

    stub_request(:post, "http://localhost:3000/api/v1/users").with(query: { 'user[email]' => 'eturambi@gmail.com', 'user[first_name]' => 'eldridge', 'user[last_name]' => 'turambi'}).to_return(status: 200, body: users_json, headers: {})

    stub_request(:post, "http://localhost:3000/api/v1/").to_return(status: 200, headers: {})

    stub_request(:delete, "http://localhost:3000/api/v1/users/1").to_return(status: 204, headers: {})
  }

  context 'class methods' do
    describe '::connection' do
      it 'returns Faraday connection' do
        user = UserService.connection

        expect(user).to be_a(Faraday::Connection)
      end
    end

    describe '::find_user' do
      it 'can get user from params' do
        user =  UserService.find_user('eturambi@gmail.com', 'eldridge', 'turambi')

        expect(user[:data][:attributes][:email]).to eq('eturambi@gmail.com')
        expect(user[:data][:attributes][:first_name]).to eq('eldridge')
        expect(user[:data][:attributes][:last_name]).to eq('turambi')
      end
    end

    describe '::delete_account' do
      it 'can destroy a users account' do
        user = UserService.find_user('eturambi@gmail.com', 'eldridge', 'turambi')
        response = UserService.delete_account(user[:data][:id])

        expect(response.status).to eq(204)
      end
    end
  end
end
