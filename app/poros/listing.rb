class Listing
  attr_reader :id,
              :year,
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
              :selling_price,
              :title

  def initialize(data = {})
    @id = data[:id]
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
    @selling_price = data[:sellingPrice]
    @title = "#{@year} #{@make} #{@model}"
  end
end
