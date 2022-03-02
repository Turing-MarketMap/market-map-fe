require 'rails_helper'

RSpec.describe 'User profile show page', :vcr, type: :feature do
  before(:each) do
    OmniAuth.config.test_mode = true
    auth_hash = Faker::Omniauth.google
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(auth_hash)
  end

  context 'as a logged in user', :vcr do
    it 'can display information on user' do
      visit '/'
      click_link 'Login with Google'

      visit '/profile'
      expect(page).to have_content("My account details:")
      expect(page).to have_content("Name: Example User")
      expect(page).to have_content("User ID: 1234")
      expect(page).to have_link("Delete my account")
      ### Add tests for saved listings
      
    end
  end
end
