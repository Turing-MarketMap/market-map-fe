require 'rails_helper'

RSpec.describe 'OmniAuth Google OAuth 2.0', :vcr, type: :feature do
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

  context 'as a user' do
    context 'user is not logged into site with OAuth' do
      describe 'viewable elements' do
        it 'displays login text' do
          visit root_path

          expect(page).to have_content('Login with Google')
        end

        it 'displays blank profile photo' do
          visit root_path

          expect(page).to have_xpath('//*[@id="navbarNoProfile"]/img')
        end
      end

      context 'user logs in with OAuth' do
        describe 'login process' do
          it 'displays user profile photo after login' do
            visit root_path
            click_link 'Login with Google'

            expect(page).to have_xpath('//*[@id="navbarDropdown"]/img')
            expect(page).to have_no_xpath('//*[@id="navbarNoProfile"]/img')
            expect(page).to have_no_content('Login with Google')
          end

          it 'enables user to visit profile page after login' do
            visit root_path
            click_link 'Login with Google'

            expect(page).to have_link('My profile', href: '/profile')
            expect(page).to have_link('Logout', href: '/logout')
          end

          it 'retrieves the user id from the user service' do
            visit root_path
            click_link 'Login with Google'

            expect(page).to have_xpath('/html/body/nav/div/div[2]/div')
          end
        end
      end
    end

    context 'user is logged into site with OAuth' do
      describe 'viewable elements' do
        it 'does not display login text' do
          visit root_path
          click_link 'Login with Google'

          expect(page).to have_no_content('Login with Google')
        end
      end

      context 'user logs out of OAuth' do
        it 'does not display user profile photo after logout' do
          visit root_path
          click_link 'Login with Google'
          click_link 'Logout'

          expect(page).to have_no_xpath('//*[@id="navbarDropdown"]/img')
          expect(page).to have_xpath('//*[@id="navbarNoProfile"]/img')
        end

        it 'displays login text' do
          visit root_path
          click_link 'Login with Google'
          click_link 'Logout'

          expect(page).to have_content('Login with Google')
        end
      end
    end
  end
end
