require 'rails_helper'

RSpec.describe 'dashboard page' do
  let!(:listings) { build(:listings, listing_count: 100) }
  let!(:listings_2) { build(:listings, listing_count: 10) }

  context 'initial dashboard settings', :vcr do
    it "is the root page" do
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
      # save_and_open_page
    end
  end

  context 'as user' do
    describe 'before logging into the site' do
      describe 'viewable elements' do

      end
    end
  end
end
