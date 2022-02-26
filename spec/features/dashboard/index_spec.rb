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

      it "has model dropdowns that match available models in database" do

        allow(ListingService).to receive(:get_makes).and_return({data: options_1})

        visit '/'
        within 'div.filters' do
          makes = ListingService.get_makes

          makes.each do |make|
            select make, from: "Make"
          end
        end
      end
    end
  end




end
