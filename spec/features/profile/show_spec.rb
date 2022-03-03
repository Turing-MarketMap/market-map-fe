require 'rails_helper'

RSpec.describe 'User profile show page', :vcr, type: :feature do

  context 'as a logged in user', :vcr do
    OmniAuth.config.test_mode = true
    auth_hash = Faker::Omniauth.google
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(auth_hash)

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

    it 'no longer shows profile page after user logs out' do
      visit '/'
      click_link 'Login with Google'
      click_link 'Logout'
      visit '/profile'
      expect(current_path).to eq('/')
      expect(page).to have_content('Please login to see user profile information')

    end

    it 'allows user to delete account' do
      visit '/'
      click_link 'Login with Google'
      visit '/profile'
      click_link 'Delete my account'
      expect(current_path).to eq('/')
      expect(page).to have_link('Login with Google')
      expect(page).to_not have_link('My Profile')
    end
  end

  context 'not logged in', :vcr do
    it 'does not show profile page' do
      visit '/profile'
      expect(current_path).to eq('/')
      expect(page).to have_content('Please login to see user profile information')
    end
  end
end
