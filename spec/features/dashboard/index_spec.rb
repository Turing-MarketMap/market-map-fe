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

      xit "has model dropdowns that match available models in database" do
        visit '/'
        within 'div.filters' do


          make_options.each do |selection|
            select selection, from: "Make"
          end
        end
      end
    end
  end




end
