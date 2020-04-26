# frozen_string_literal: true

describe Car do
  describe '#validate!' do
    it 'cannot have a model year less than a year of manufacture' do
      manufacturing_year = 2000
      model_year = 1999
      builder = CarBuilder.new
                          .with_manufacturing_year(manufacturing_year)
                          .with_model_year(model_year)
      invalid_car = builder.build_car
      erro = 'model year cannot be earlier than the year of manufacture'
      expect(invalid_car.validate!).to be_falsey
      expect(invalid_car.erros.size).to eq(1)
      expect(invalid_car.erros.first).to eq(erro)
    end

    it 'should have a specified license_plate' do
      builder = CarBuilder.new.with_license_plate(nil)
      invalid_car = builder.build_car
      erro = 'license plate cannot be null'
      expect(invalid_car.validate!).to be_falsey
      expect(invalid_car.erros.size).to eq(1)
      expect(invalid_car.erros.first).to eq(erro)
    end

    it 'should have a specified model' do
      builder = CarBuilder.new.with_model(nil)
      invalid_car = builder.build_car
      erro = 'model cannot be null'
      expect(invalid_car.validate!).to be_falsey
      expect(invalid_car.erros.size).to eq(1)
      expect(invalid_car.erros.first).to eq(erro)
    end

    it 'should have a specified manufacturer' do
      builder = CarBuilder.new.with_manufacturer(nil)
      invalid_car = builder.build_car
      erro = 'manufacturer cannot be null'
      expect(invalid_car.validate!).to be_falsey
      expect(invalid_car.erros.size).to eq(1)
      expect(invalid_car.erros.first).to eq(erro)
    end
  end
end
