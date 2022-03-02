require 'rails_helper'


RSpec.describe 'Listings search', type: :feature do
  context 'as a logged in user', :vcr do
    it 'can display matching cars when search is completed' do
      visit '/'
      fill_in "Min year", with: 2002
      fill_in "Max year", with: 2015
      select "Subaru", from: "Make"
      select "Subaru: Outback", from: "Model"

      click_button "Search Listings"

      expect(current_path).to eq('/')
      visit '/'
    end
  end
end
