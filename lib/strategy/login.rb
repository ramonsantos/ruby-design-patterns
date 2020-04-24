# frozen_string_literal: true

class Login
  def self.with(params)
    if params[:method] == :facenote
      LoginByFaceNote.authenticate(params[:data])
    elsif params[:method] == :zuiter
      LoginByZuiter.authenticate(params[:data])
    end
  end
end
