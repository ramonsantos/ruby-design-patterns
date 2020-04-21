describe Personagem do
  context 'utilizando adaga' do
    it 'tem +10 de forca de ataque' do
      personagem = Personagem.new(dano_base: 5)
      adaga = Adaga.new
      personagem.equipar_arma(adaga)
      forca_de_ataque = personagem.forca_de_ataque
      expect(forca_de_ataque).to eq(15)
    end

    it 'ganha +3 na velocidade de ataque' do
      personagem = Personagem.new(dano_base: 5, velocidade: 7)
      adaga = Adaga.new
      personagem.equipar_arma(adaga)
      velocidade_de_ataque = personagem.velocidade_de_ataque
      expect(velocidade_de_ataque).to eq(10)
    end

    context 'com encatamento magico' do
      it 'tem +15 de forca de ataque' do
        personagem = Personagem.new(dano_base: 5)
        adaga_magica = ArmaMagica.new(Adaga.new)
        personagem.equipar_arma(adaga_magica)
        forca_de_ataque = personagem.forca_de_ataque
        expect(forca_de_ataque).to eq(20)
      end

      it 'ganha +7 na velocidade de ataque' do
        personagem = Personagem.new(dano_base: 5, velocidade: 7)
        adaga_magica = ArmaMagica.new(Adaga.new)
        personagem.equipar_arma(adaga_magica)
        velocidade_de_ataque = personagem.velocidade_de_ataque
        expect(velocidade_de_ataque).to eq(14)
      end
    end
  end

  context 'utilizando espada longa' do
    it 'tem forca de ataque +20' do
      personagem = Personagem.new(dano_base: 5)
      espada = EspadaLonga.new
      personagem.equipar_arma(espada)
      forca_de_ataque = personagem.forca_de_ataque
      expect(forca_de_ataque).to eq(25)
    end

    it 'recebe -2 de redução na velocidade de ataque' do
      personagem = Personagem.new(dano_base: 5, velocidade: 7)
      espada = EspadaLonga.new
      personagem.equipar_arma(espada)
      velocidade_de_ataque = personagem.velocidade_de_ataque
      expect(velocidade_de_ataque).to eq(5)
    end

    context 'com encatamento magico' do
      it 'tem +25 de forca de ataque' do
        personagem = Personagem.new(dano_base: 5)
        espada_magica = ArmaMagica.new(EspadaLonga.new)
        personagem.equipar_arma(espada_magica)
        forca_de_ataque = personagem.forca_de_ataque
        expect(forca_de_ataque).to eq(30)
      end

      it 'recebe +2 de bonus na velocidade de ataque' do
        personagem = Personagem.new(dano_base: 5, velocidade: 7)
        espada_magica = ArmaMagica.new(EspadaLonga.new)
        personagem.equipar_arma(espada_magica)
        velocidade_de_ataque = personagem.velocidade_de_ataque
        expect(velocidade_de_ataque).to eq(9)
      end
    end
  end
end
