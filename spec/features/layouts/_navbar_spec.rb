require 'rails_helper'

RSpec.describe 'Navbar html partial', :vcr, type: :feature do
  context 'as a user' do
    describe 'clickable elements' do
      it 'has a button to redirect to the home page' do
        visit root_path

        expect(page).to have_xpath('//*[@id="navbarSupportedContent"]/a')
      end
    end
  end
end
