# frozen_string_literal: true

class MagicWeapon
  attr_reader :weapon

  def initialize(weapon)
    @weapon = weapon
  end

  def damage
    @weapon.damage + 5
  end

  def speed_bonus
    @weapon.speed_bonus + 4
  end
end
