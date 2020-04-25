# frozen_string_literal: true

class CarBuilder
  attr_reader :model, :manufacturer, :manufacturing_year, :license_plate,
              :color, :rode_km, :model_year, :minimum_price, :announced_price

  def initialize
    @model = 'Modelo A123'
    @manufacturer = 'Fabricante ABCD'
    @license_plate = 'ABC1234'
    @manufacturing_year = 2000
    @model_year = 2001
  end

  def build_car
    Car.new(
      @model, @manufacturer, @manufacturing_year, @license_plate,
      @color, @rode_km, @model_year, @minimum_price, @announced_price
    )
  end

  def with_color(color)
    @color = color
    self
  end

  def with_minimum_price(minimum_price)
    @minimum_price = minimum_price
    self
  end

  def with_announced_price(announced_price)
    @announced_price = announced_price
    self
  end

  def with_mileage(rode_km)
    @rode_km = rode_km
    self
  end

  def with_license_plate(license_plate)
    @license_plate = license_plate
    self
  end

  def with_model(model)
    @model = model
    self
  end

  def with_manufacturer(manufacturer)
    @manufacturer = manufacturer
    self
  end

  def with_model_year(model_year)
    @model_year = model_year
    self
  end

  def with_manufacturing_year(manufacturing_year)
    @manufacturing_year = manufacturing_year
    self
  end
end
