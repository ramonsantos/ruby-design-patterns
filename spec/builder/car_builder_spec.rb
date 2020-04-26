# frozen_string_literal: true

describe CarBuilder do
  context 'with default values' do
    it 'should create a valid car' do
      builder = CarBuilder.new
      car = builder.build_car
      expect(car.validate!).to be_truthy
    end
  end

  context 'with extra values' do
    it 'shouldconfigure a car with a color and mileage' do
      builder = CarBuilder.new.with_color('azul').with_mileage(100)
      car = builder.build_car
      expect(car.color).to eq('azul')
      expect(car.rode_km).to eq(100)
    end

    it 'should configure a car with minimum price and advertised' do
      builder = CarBuilder.new.with_minimum_price(20_000).with_announced_price(22_000)
      car = builder.build_car
      expect(car.minimum_price).to eq(20_000)
      expect(car.announced_price).to eq(22_000)
    end

    it 'should configure a car with model year and manufacture' do
      builder = CarBuilder.new.with_model_year(2015).with_manufacturing_year(2014)
      car = builder.build_car
      expect(car.model_year).to eq(2015)
      expect(car.manufacturing_year).to eq(2014)
    end

    it 'should create a car with manufacturer, model and license_plate' do
      builder = CarBuilder.new
                          .with_manufacturer('Fabricante DCBA')
                          .with_model('Modelo B321')
                          .with_license_plate('CBA4321')
      car = builder.build_car
      expect(car.manufacturer).to eq('Fabricante DCBA')
      expect(car.model).to eq('Modelo B321')
      expect(car.license_plate).to eq('CBA4321')
    end
  end
end
