# frozen_string_literal: true

class LoginByZuiter
  ZUITER_SUCCESS = 202
  ZUITER_PENDING = 400

  class << self
    def authenticate(params)
      params[:user].downcase!
      status, message = build_response(ZuiterLoginService.authenticate(params))
      { status: status, message: message }
    end

    private

    def build_response(response)
      case response
      when ZUITER_SUCCESS
        [true, 'login successfully']
      when ZUITER_PENDING
        [false, 'pending authorization']
      else
        [false, 'unable to authenticate']
      end
    end
  end
end
