require 'rails_helper'

RSpec.describe 'OmniAuth Google OAuth 2.0', :vcr, type: :feature do
  before(:each) do
    OmniAuth.config.test_mode = true
    auth_hash = Faker::Omniauth.google
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(auth_hash)
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
