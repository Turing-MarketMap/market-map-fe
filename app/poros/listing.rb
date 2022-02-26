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
end
