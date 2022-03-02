require 'rails_helper'

RSpec.describe 'User profile show page' do
  context 'as a logged in user', :vcr do
    it 'can display information on user' do
      visit '/profile'
      expect(page).to have_content("Saved listings: ")
      expect(page).to have_link("Delete my account")
      expect(page).to have_content("My account details: ")
    end
  end
end
