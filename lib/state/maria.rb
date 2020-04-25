# frozen_string_literal: true

class Maria
  attr_reader :current_state

  def initialize
    @current_state = Little.new
  end

  def take_ice_flower
    @current_state = @current_state.take_ice_flower
  end

  def take_fire_flower
    @current_state = @current_state.take_fire_flower
  end

  def take_star
    @current_state = @current_state.take_star
  end

  def take_damage
    @current_state = @current_state.take_damage
  end
end
