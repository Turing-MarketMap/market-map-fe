require 'rails_helper'

RSpec.describe 'User Service' do

  it 'can get all users', :vcr do
    users =  UserService.all_users#[:data]
    expect(users).to be_a(Hash)
  end
end
