require 'rails_helper'

RSpec.describe 'Listings Show Page', type: :feature do
  context 'as a logged in user', :vcr do
    describe 'viewable elements' do
      it 'displays an image of the listing' do
        listing_data = {
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

        listing = build(:listing, listing_data)
        listing_attr = {
                        id: listing.id,
                        year: listing.year,
                        make: listing.make,
                        model: listing.model,
                        trim: listing.trim,
                        body: listing.body,
                        transmission: listing.transmission,
                        vin: listing.vin,
                        state: listing.state,
                        condition: listing.condition,
                        odometer: listing.odometer,
                        color: listing.color,
                        interior: listing.interior,
                        selling_price: listing.selling_price,
                        title: listing.title
                       }

        image = ImageFacade.search_for_listing_image(listing.title, listing.color)
        visit listing_path(listing.id, listing: listing_attr)

        expect(page).to have_css('img')
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
