require 'rails_helper'

RSpec.describe 'dashboard page' do
  let!(:listings) { build(:listings, listing_count: 100) }
  let!(:listings_2) { build(:listings, listing_count: 10) }

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

  context 'initial dashboard settings', :vcr do
    it "is the root page", :vcr do
      visit '/'
      expect(page).to have_content("Market Map")
    end

    describe 'filters' do
      describe 'filters' do
        it "they exist", :vcr do
          visit '/'

          within 'div.filters' do
            select 'Subaru', from: "Make"
            select 'Subaru: Impreza', from: "Model"
            #select 2002, from: "Min Year"
            #select 2015, from: "Max Year"
            #select 5000, from: "Min Price"
            #select 30000, from: "Max Price"
            #select 5000, from: "Min Mileage"
            #select 30000, from: "Max Mileage"



            #fill_in "Make", with: 'Subaru'
            #fill_in "Model", with: 'Impreza'
            fill_in "Min year", with: 2002
            fill_in "Max year", with: 2015
            fill_in "Min price", with: 5000
            fill_in "Max price", with: 30000
            fill_in "Min mileage", with: 5000
            fill_in "Max mileage", with: 30000

            click_on "Search Listings"

          end
          expect(current_path).to eq('/')
        end
      end

      describe 'model filters' do
        # Issue: Dashboard can't read currently selected "make" to filter model
        xit "has model dropdowns that match available models in retreived listings" do
          make = listings_2.listings.sample(1)[0].make
          models = listings_2.all_models(make)

          allow(ListingFacade).to receive(:get_listings).and_return(listings_2)

          visit '/'

          within 'div.filters' do
            select make, from: "Make"
            models.each do |model|
              select model, from: "Model"
            end
          end
        end
      end

      describe 'year filters' do
        xit "has year range field" do

          #allow(ListingService).to receive(:get_makes).and_return({data: make_options_1})
          allow(ListingFacade).to receive(:get_listings).and_return(listings)
          allow(Listing).to receive(:all_makes).and_return(make_options_2)

          visit '/'
          within 'div.filters' do
            #select , from: "Make"
          end
        end
      end
    end
  end

  describe 'Link to listing show page' do

    xit 'sees link that routes to listing show page' do
      visit '/'


    end
  end

  context 'as user' do
    it 'logs in and saves listings' do
      VCR.use_cassette('login') do
        visit '/'
        click_link 'Login with Google'

        VCR.use_cassette('visit listing') do
          visit '/listings/1'
          click_link 'Save listing'
          visit '/listings/2'
          click_link 'Save listing'
          visit '/listings/3'
          click_link 'Save listing'

          visit '/'
          save_and_open_page
          expect(page).to have_content("USER LISTING 1 - ETC")
        end
      end


      # describe 'can save and show listings', :vcr do
      #   it 'can visit listings', :vcr do
      #     visit '/'
      #     click_link 'Login with Google'
      #   end
      #
      #
      #   it '2', :vcr do
      #     visit '/listings/1'
      #     click_link 'Save listing'
      #     visit '/listings/2'
      #     click_link 'Save listing'
      #     visit '/listings/3'
      #     click_link 'Save listing'
      #
      #     visit '/'
      #     expect(page).to have_content("USER LISTING 1 - ETC")
      #   end
      #
      # end

    end
  end
end
