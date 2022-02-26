require 'rails_helper'

RSpec.describe 'dashboard page' do
  let!(:listings) { build_list(:listing, 10) }


  it "is the root page" do
    allow(ListingFacade).to (receive(:get_listings).and_return(listings))
    visit '/'
    expect(page).to have_content("Market Map")
  end

  describe 'filters' do
    describe 'model filters' do
      let!(:make_options_1) { ["A", "B", "C"] }
      let!(:make_options_2) { ["A", "B", "C", "D", "E"] }


      it "has model dropdowns that match available models in retreived listings" do

        #allow(ListingService).to receive(:get_makes).and_return({data: make_options_1})
        allow(ListingFacade).to receive(:get_listings).and_return(listings)
        allow(Listing).to receive(:all_makes).and_return(make_options_2)


        visit '/'
        within 'div.filters' do
          make_options_2.each do |make|
            select make, from: "Make"
          end
        end
      end
    end
  end




end
