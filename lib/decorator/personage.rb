# frozen_string_literal: true

class Personage
  attr_reader :damage_base, :current_weapon, :velocity

  def initialize(data)
    @damage_base = data[:damage_base]
    @velocity = data[:velocity]
  end

  def equip_weapon(weapon)
    @current_weapon = weapon
  end

  def attack_force
    @damage_base + @current_weapon.damage
  end

  def attack_speed
    @velocity + @current_weapon.speed_bonus
  end
end
