require 'rails_helper'

RSpec.describe 'dashboard page' do
  let!(:listings) { build_list(:listing, 100) }
  let!(:listings_2) { build_list(:listing, 10) }

  context 'initial dashboard settings', :vcr do
    it "is the root page", :vrc do
      VCR.insert_cassette('dashboard root_1') do
        visit '/'
        expect(page).to have_content("Market Map")
      end
    end

    describe 'filters' do
      describe 'filters' do
        it "they exist", :vcr do
          VCR.insert_cassette('dashboard root_1') do
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

              click_on "Search Listings"
            end
            expect(current_path).to eq('/')
          end
        end
      end
    end
  end
end
