# frozen_string_literal: true

describe Personage do
  context 'when using dagger' do
    it 'has +10 attack force' do
      personage = Personage.new(damage_base: 5)
      dagger = Dagger.new
      personage.equip_weapon(dagger)
      attack_force = personage.attack_force
      expect(attack_force).to eq(15)
    end

    it 'gains +3 attack speed' do
      personage = Personage.new(damage_base: 5, velocity: 7)
      dagger = Dagger.new
      personage.equip_weapon(dagger)
      attack_speed = personage.attack_speed
      expect(attack_speed).to eq(10)
    end

    context 'with magical enchantment' do
      it 'has +15 attack force' do
        personage = Personage.new(damage_base: 5)
        magic_dagger = MagicWeapon.new(Dagger.new)
        personage.equip_weapon(magic_dagger)
        attack_force = personage.attack_force
        expect(attack_force).to eq(20)
      end

      it 'gains +7 attack speed' do
        personage = Personage.new(damage_base: 5, velocity: 7)
        magic_dagger = MagicWeapon.new(Dagger.new)
        personage.equip_weapon(magic_dagger)
        attack_speed = personage.attack_speed
        expect(attack_speed).to eq(14)
      end
    end
  end

  context 'when using long sword' do
    it 'has +20 attack force' do
      personage = Personage.new(damage_base: 5)
      sword = LongSword.new
      personage.equip_weapon(sword)
      attack_force = personage.attack_force
      expect(attack_force).to eq(25)
    end

    it 'loses -2 of speed attack' do
      personage = Personage.new(damage_base: 5, velocity: 7)
      sword = LongSword.new
      personage.equip_weapon(sword)
      attack_speed = personage.attack_speed
      expect(attack_speed).to eq(5)
    end

    context 'with magical enchantment' do
      it 'has +25 attack force' do
        personage = Personage.new(damage_base: 5)
        magic_sword = MagicWeapon.new(LongSword.new)
        personage.equip_weapon(magic_sword)
        attack_force = personage.attack_force
        expect(attack_force).to eq(30)
      end

      it 'gains +2 attack speed bonus' do
        personage = Personage.new(damage_base: 5, velocity: 7)
        magic_sword = MagicWeapon.new(LongSword.new)
        personage.equip_weapon(magic_sword)
        attack_speed = personage.attack_speed
        expect(attack_speed).to eq(9)
      end
    end
  end
end
