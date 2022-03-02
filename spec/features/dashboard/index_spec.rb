require 'rails_helper'

RSpec.describe 'dashboard page' do
  let!(:listings) { build(:listings, listing_count: 100) }
  let!(:listings_2) { build(:listings, listing_count: 10) }

  context 'initial dashboard settings', :vcr do
    it "is the root page", :vrc do
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


  context 'as user' do
    describe 'before logging into the site' do
      describe 'viewable elements' do

      end
    end
  end
end
