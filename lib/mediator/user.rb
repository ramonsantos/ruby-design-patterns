# frozen_string_literal: true

class User
  attr_accessor :email, :products_of_interest

  def initialize(params)
    @email = params[:email]
    @products_of_interest = params[:products_of_interest]
  end
end
