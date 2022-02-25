require 'rails_helper'

RSpec.describe 'listing poro' do
  let!(:listing) { build(:listing,
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
                        sellingPrice: 8900
                        ) }

  it "exists" do
    expect(listing).to be_a(Listing)
  end

  it "has correct attributes" do
    expect(listing.year).to be_a(Integer)
    expect(listing.make).to be_a(String)
    expect(listing.model).to be_a(String)
    expect(listing.trim).to be_a(String)
    expect(listing.body).to be_a(String)
    expect(listing.transmission).to be_a(String)
    expect(listing.vin).to be_a(String)
    expect(listing.state).to be_a(String)
    expect(listing.condition).to be_a(Float)
    expect(listing.odometer).to be_a(Integer)
    expect(listing.color).to be_a(String)
    expect(listing.interior).to be_a(String)
    expect(listing.sellingPrice).to be_a(Integer)

    expect(listing.year).to eq(2015)
    expect(listing.make).to eq("Honda")
    expect(listing.model).to eq("Civic")
    expect(listing.trim).to eq("LX")
    expect(listing.body).to eq("sedan")
    expect(listing.transmission).to eq("automatic")
    expect(listing.vin).to eq("19xfb2f58ce307205")
    expect(listing.state).to eq("ca")
    expect(listing.condition).to eq(2.6)
    expect(listing.odometer).to eq(73995)
    expect(listing.color).to eq("gray")
    expect(listing.interior).to eq("gray")
    expect(listing.sellingPrice).to eq(8900)
  end
end
