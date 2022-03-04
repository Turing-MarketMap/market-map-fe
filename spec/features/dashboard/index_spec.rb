require 'rails_helper'

RSpec.describe 'dashboard page' do
  let!(:listings) { build_list(:listing, 100) }
  let!(:listings_2) { build_list(:listing, 10) }

  context 'initial dashboard settings' do
    it "is the root page", :vcr do
      visit '/'
      expect(page).to have_content("Market Map")
    end

    describe 'filters' do
      it "they exist", :vcr do
        visit '/'

        within 'div.filters' do
          select 'Subaru', from: "Make"
          select 'Subaru: Impreza', from: "Model"

          fill_in "Min year", with: 2002
          fill_in "Max year", with: 2015
          fill_in "Min price", with: 5000
          fill_in "Max price", with: 30000
          fill_in "Min mileage", with: 5000
          fill_in "Max mileage", with: 30000

          expect(page).to have_current_path("/")
          click_on "Search Listings"
        end

        expected = "/?utf8=%E2%9C%93&search_params[make]=Subaru&search_params[model]=Impreza&search_params[min_year]=2002&search_params[max_year]=2015&search_params[min_price]=5000&search_params[max_price]=30000&search_params[min_mileage]=5000&search_params[max_mileage]=30000&commit=Search+Listings"
        expect(page).to have_current_path(expected)
      end
    end

    describe 'as a logged on user' do
      it 'can see and save listing', :vcr do
        auth_hash = {
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
        OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new(auth_hash)
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:default]

        visit '/'
        expect(page).to_not have_content('Year')


        click_link 'Login with Google'
        expect(page).to_not have_link('Login with Google')
        expect(page).to have_content('Price')
        expect(page).to have_content('Year')
        expect(page).to have_content('Make')
        expect(page).to have_content('Model')

        visit '/listings/1'
        click_button 'Save Listing'
        expect(current_path).to eq('/profile')

        visit '/listings/2'
        click_button 'Save Listing'

        visit '/'

        expect(page).to have_content('21250')
        expect(page).to have_content('2014')
        expect(page).to have_content('Acura')
        expect(page).to have_content('ILX')
      end
    end
  end
end
