# frozen_string_literal: true

class IceFlower
  def take_ice_flower
    self
  end

  def take_star
    Star.new
  end

  def take_damage
    Little.new
  end

  def take_fire_flower
    FireFlower.new
  end
end
