require 'rails_helper'

RSpec.describe 'dashboard page' do
  let!(:listings) { build(:listings, listing_count: 10) }
  let!(:listings_2) { build(:listings, listing_count: 10) }


  it "is the root page" do
    allow(ListingFacade).to receive(:get_listings).and_return(listings)
    visit '/'
    expect(page).to have_content("Market Map")
  end

  describe 'filters' do
    describe 'make filters' do
      let!(:make_options_1) { ["A", "B", "C"] }
      let!(:make_options_2) { ["A", "B", "C", "D", "E"] }

      it "has model dropdowns that match available models in retreived listings" do

        #allow(ListingService).to receive(:get_makes).and_return({data: make_options_1})
        allow(ListingFacade).to receive(:get_listings).and_return(listings)
        allow(listings).to receive(:all_makes).and_return(make_options_2)

        visit '/'

        within 'div.filters' do
          make_options_2.each do |make|
            select make, from: "Make"
          end
        end
      end
    end

    describe 'model filters' do
      it "has model dropdowns that match available models in retreived listings" do
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
