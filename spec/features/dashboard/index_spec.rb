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
  end
end
