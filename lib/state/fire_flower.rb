# frozen_string_literal: true

class FireFlower
  def take_ice_flower
    IceFlower.new
  end

  def take_star
    Star.new
  end

  def take_damage
    Little.new
  end

  def take_fire_flower
    self
  end
end
