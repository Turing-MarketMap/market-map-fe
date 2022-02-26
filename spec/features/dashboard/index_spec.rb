require 'rails_helper'

RSpec.describe 'dashboard page' do

  it "is the root page" do
    visit '/'
    expect(page).to have_content("Market Map")
  end

  describe 'filters' do
    describe 'model filters' do
      let!(:make_options_1) { ["A", "B", "C"] }
      let!(:make_options_2) { ["A", "B", "C", "D", "E"] }
      let!(:listings) { build_list(:listing, 10) }

      it "has model dropdowns that match available models in retreived listings" do

        #allow(ListingService).to receive(:get_makes).and_return({data: make_options_1})

        allow(ListingFacade).to (receive(:get_listings).and_return(listings))

        visit '/'
        within 'div.filters' do
          listings.each do |listing|
            select listing.make, from: "Make"
          end
        end
      end
    end
  end




end
