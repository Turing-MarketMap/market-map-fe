class Listing
  attr_reader :year,
              :make,
              :model,
              :trim,
              :body,
              :transmission,
              :vin,
              :state,
              :condition,
              :odometer,
              :color,
              :interior,
              :sellingPrice

  def initialize(data = {})
    @year = data[:year]
    @make = data[:make]
    @model = data[:model]
    @trim = data[:trim]
    @body = data[:body]
    @transmission = data[:transmission]
    @vin = data[:vin]
    @state = data[:state]
    @condition = data[:condition]
    @odometer = data[:odometer]
    @color = data[:color]
    @interior = data[:interior]
    @sellingPrice = data[:sellingPrice]
  end

  def self.all_makes
    ["Acura",
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
    "vw"]
  end
end
