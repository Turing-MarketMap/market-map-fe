require 'rails_helper'


RSpec.describe 'Listings search', type: :feature do
  context 'as a logged in user', :vcr do
    it 'can display matching cars when search is completed' do
      visit '/'
      fill_in :min_year, with: 2001
      fill_in :max_year, with: 2005
      fill_in :make, with: "Toyota"
      fill_in :model, with: "Camry"

      click_button "Search Listings"

      expect(current_path).to eq('/')
      visit '/'
    end
  end
end
