require 'rails_helper'

RSpec.describe 'User profile show page', :vcr, type: :feature do
  before(:each) do
    @auth_hash = {
                   :provider=>"google_oauth2",
                   :uid=>"129685862",
                   :info=>
                   {:name=>"Tommy Bartell",
                     :first_name=>"Tommy",
                     :last_name=>"Bartell",
                     :email=>"bartell_tommy@example.net",
                     :image=>"https://via.placeholder.com/300x300.png"},
                   :credentials=>{:token=>"48373cd503f23b4082054bd5a8f323f1", :refresh_token=>"8bb37a20155a666109c69ad3d130f3ca", :expires_at=>1654115722, :expires=>true},
                   :extra=>
                   {:raw_info=>
                     {:sub=>"129685862",
                       :email=>"bartell_tommy@example.net",
                       :email_verified=>"true",
                       :name=>"Tommy Bartell",
                       :given_name=>"Tommy",
                       :family_name=>"Bartell",
                       :profile=>"https://plus.google.com/129685862",
                       :picture=>"https://via.placeholder.com/300x300.png",
                       :gender=>"male",
                       :birthday=>"2011-09-29",
                       :local=>"en",
                       :hd=>"hamill, jaskolski and sanford.com"},
                     :id_info=>
                     {:iss=>"accounts.google.com",
                       :at_hash=>"261c645d753525cf3bb59beb217e29bb",
                       :email_verified=>true,
                       :sub=>"6494961853896762788693140485",
                       :azp=>"APP_ID",
                       :email=>"bartell_tommy@example.net",
                       :aud=>"APP_ID",
                       :iat=>1650611324,
                       :exp=>1649622184,
                       :openid_id=>"https://www.google.com/accounts/o8/id?id=129685862"
                     }
                   }
                 }

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new(@auth_hash)
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:default]
  end

  context 'as a logged in user', :vcr do
    it 'can display information on user' do
      visit '/'
      click_link 'Login with Google'

      visit '/profile'

      expect(page).to have_content("My account details:")
      expect(page).to have_content("Name: Tommy Bartell")
      expect(page).to have_content("User ID: 1")
      expect(page).to have_link("Delete my account")
      ### Add tests for saved listings
    end

    it 'no longer shows profile page after user logs out and flash message' do
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
