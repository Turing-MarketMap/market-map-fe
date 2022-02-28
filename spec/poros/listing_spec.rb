require 'rails_helper'

RSpec.describe 'listing poro' do
  let!(:listing) { build(:listing,
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
                        selling_price: 8900,
                        title: '2015 Honda Civic'
                        ) }

  it "exists" do
    expect(listing).to be_a(Listing)
  end

  xit "has correct attributes" do
    expect(listing.id).to be_a(Integer)
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
    expect(listing.selling_price).to be_a(Integer)
    expect(listing.title).to be_a(String)

    expect(listing.id).to eq(1)
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
    expect(listing.selling_price).to eq(8900)
    expect(listing.title).to eq('2015 Honda Civic')
  end

  xit "has factory with correct default attributes" do
    listing = build(:listing)
    expect(listing.id).to be_a(Integer)
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
    expect(listing.selling_price).to be_a(Integer)
    expect(listing.title).to be_a(String)
    expect(listing.title).to eq("#{listing.year} #{listing.make} #{listing.model}")
  end


  describe 'class methods' do
    describe '.all_makes' do
      it "returns a hash of all the available makes in the model" do
        expect(Listing.all_makes).to eq(["Acura",
                                        "airstream",
                                        "Aston Martin",
                                        "Audi",
                                        "Bentley",
                                        "BMW",
                                        "Buick",
                                        "Cadillac",
                                        "chev truck",
                                        "Chevrolet",
                                        "Chrysler",
                                        "Daewoo",
                                        "Dodge",
                                        "dodge tk",
                                        "dot",
                                        "Ferrari",
                                        "FIAT",
                                        "Fisker",
                                        "Ford",
                                        "ford tk",
                                        "ford truck",
                                        "Geo",
                                        "GMC",
                                        "gmc truck",
                                        "Honda",
                                        "HUMMER",
                                        "Hyundai",
                                        "hyundai tk",
                                        "Infiniti",
                                        "Isuzu",
                                        "Jaguar",
                                        "Jeep",
                                        "Kia",
                                        "Lamborghini",
                                        "Land Rover",
                                        "landrover",
                                        "Lexus",
                                        "Lincoln",
                                        "Lotus",
                                        "Maserati",
                                        "Mazda",
                                        "mazda tk",
                                        "mercedes",
                                        "mercedes-b",
                                        "Mercedes-Benz",
                                        "Mercury",
                                        "MINI",
                                        "Mitsubishi",
                                        "Nissan",
                                        "Oldsmobile",
                                        "plymouth",
                                        "pontiac",
                                        "Porsche",
                                        "Ram",
                                        "Rolls-Royce",
                                        "Saab",
                                        "Saturn",
                                        "Scion",
                                        "smart",
                                        "Subaru",
                                        "Suzuki",
                                        "Tesla",
                                        "Toyota",
                                        "Volkswagen",
                                        "Volvo",
                                        "vw"])
      end
    end
  end
end
