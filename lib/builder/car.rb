# frozen_string_literal: true

class Car
  # attr_reader :erros

  attr_reader :model, :manufacturer, :manufacturing_year, :license_plate,
              :color, :rode_km, :model_year, :minimum_price, :announced_price

  def initialize(model, manufacturer, manufacturing_year, license_plate,
                 color, rode_km, model_year, minimum_price, announced_price)
    @model = model
    @manufacturer = manufacturer
    @manufacturing_year = manufacturing_year
    @model_year = model_year
    @license_plate = license_plate
    @color = color || ''
    @rode_km = rode_km || 0
    @minimum_price = minimum_price || 0
    @announced_price = announced_price || 0
  end

  def validate!
    erros.empty?
  end

  def erros
    @erros ||= validate_attributes
  end

  private

  def years_valid?
    manufacturing_year && model_year && manufacturing_year > model_year
  end

  def validate_attributes
    [].tap do |erros|
      erros << 'model year cannot be earlier than the year of manufacture' if years_valid?
      erros << 'license plate cannot be null' unless @license_plate
      erros << 'model cannot be null' unless @model
      erros << 'manufacturer cannot be null' unless @manufacturer
    end
  end
end
