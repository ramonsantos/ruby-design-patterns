# frozen_string_literal: true

class Little
  def take_ice_flower
    IceFlower.new
  end

  def take_star
    Star.new
  end

  def take_damage
    Dead.new
  end

  def take_fire_flower
    FireFlower.new
  end
end
