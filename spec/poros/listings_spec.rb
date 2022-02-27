require 'rails_helper'

RSpec.describe 'Listings poro' do
  let!(:listings_object) { build(:listings, listing_count: 3) }

  it "exists" do
    expect(listings_object).to be_a(Listings)
  end

  it "has a collection of listing objects" do
    expect(listings_object.listings).to be_a(Array)
    expect(listings_object.listings.sample(1)[0]).to be_a(Listing)
  end

  describe 'instance methods' do
    let!(:listing_1) { build(:listing, make: 'Honda', model: 'Civic')}
    let!(:listing_2) { build(:listing, make: 'Honda', model: 'Accord')}
    let!(:listing_3) { build(:listing, make: 'Mazda', model: 'Mazda3')}

    let!(:listings_object) { Listings.new([listing_1, listing_2, listing_3]) }

    describe '#all_makes' do
      it "returns an array of all the available makes in the collection" do
        expect(listings_object.all_makes).to eq(['Honda', 'Mazda'])
      end
    end

    describe '#all_models' do
      it "returns an array of all of the available models for the chosen make" do
        expect(listings_object.all_models('Honda')).to be_a(Array)
        expect(listings_object.all_models('Honda')).to eq(['Accord', 'Civic'])
        expect(listings_object.all_models('Mazda')).to eq(['Mazda3'])
      end
    end
  end

  describe 'class methods' do
    describe '.all_makes' do
      xit "returns a hash of all the available makes in the base model" do
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
