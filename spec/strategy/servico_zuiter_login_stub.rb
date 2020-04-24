# frozen_string_literal: true

class ZuiterLoginService
  def self.authenticate(dados)
    return 202 if dados[:user] == 'gil'
    return 400 if dados[:user] == 'ana'

    404
  end
end
