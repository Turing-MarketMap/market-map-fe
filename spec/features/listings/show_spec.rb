require 'rails_helper'

RSpec.describe 'Listings Show Page', type: :feature do
  before(:each) do
    @listing_data = {
                    id: 1,
                    year: 2015,
                    make: "Honda",
                    model: "Civic",
                    trim: "LX",
                    body: "sedan",
                    transmission: "automatic",
                    vin: "19xfb2f58ce307205",
                    state: "ca",
                    condition: 2.6,
                    odometer: 73995,
                    color: "gray",
                    interior: "gray",
                    sellingPrice: 8900,
                    title: '2015 Honda Civic',
                    data_hash: {
                                id: 1,
                                year: 2015,
                                make: "Honda",
                                model: "Civic",
                                trim: "LX",
                                body: "sedan",
                                transmission: "automatic",
                                vin: "19xfb2f58ce307205",
                                state: "ca",
                                condition: 2.6,
                                odometer: 73995,
                                color: "gray",
                                interior: "gray",
                                sellingPrice: 8900,
                                title: '2015 Honda Civic'
                               }
                   }

    @listing = build(:listing, @listing_data)
    @listing_attr = {
                    id: @listing.id,
                    year: @listing.year,
                    make: @listing.make,
                    model: @listing.model,
                    trim: @listing.trim,
                    body: @listing.body,
                    transmission: @listing.transmission,
                    vin: @listing.vin,
                    state: @listing.state,
                    condition: @listing.condition,
                    odometer: @listing.odometer,
                    color: @listing.color,
                    interior: @listing.interior,
                    selling_price: @listing.selling_price,
                    title: @listing.title
                   }

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
    describe 'viewable elements' do
      it 'displays an image of the listing' do
        visit root_path
        click_link 'Login with Google'

        image = ImageFacade.search_for_listing_image(@listing.title, @listing.color)
        visit listing_path(@listing.id, listing: @listing_attr)

        expect(page).to have_css('img')
      end

      it 'displays button to save listing' do
        visit root_path
        click_link 'Login with Google'

        visit listing_path(@listing.id, listing: @listing_attr)

        expect(page).to have_button("Save Listing")
      end

      it 'save listing button redirects to profile page' do
        visit root_path
        click_link 'Login with Google'

        visit listing_path(@listing.id, listing: @listing_attr)

        click_on("Save Listing")

        expect(current_path).to eq("/profile")
      end

      it 'after clicking save listing button, you see the listing saved on your profile page' do
        visit root_path
        click_link 'Login with Google'

        visit listing_path(@listing.id, listing: @listing_attr)

        click_on("Save Listing")

        expect(page).to have_content('2015 Honda Civic')
      end
    end
  end

  context 'as a visitor', :vcr do
    describe 'viewable elements' do
      it 'doesnt display save listing button' do
        expect(page).to_not have_button("Save Listing")
      end
    end
  end

  describe 'listing show page' do
    it 'displays attributes of listing by id', :vcr do
      # listing = build(:listing)
      visit "/listings/#{1}"
      expect(page).to have_content("make")
      expect(page).to have_content("model")
      expect(page).to have_content("year")
      expect(page).to have_content("odometer")
    end
  end
end
