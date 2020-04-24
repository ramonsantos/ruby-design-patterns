# frozen_string_literal: false

require_relative 'servico_zuiter_login_stub.rb'

describe LoginByZuiter do
  it 'returns success to user Gil' do
    params = { user: 'Gil' }
    response = LoginByZuiter.authenticate(params)
    expect(response[:status]).to be true
    expect(response[:message]).to eq('login successfully')
  end

  it 'returns pending authorization for user Ana' do
    params = { user: 'Ana' }
    response = LoginByZuiter.authenticate(params)
    expect(response[:status]).to be false
    expect(response[:message]).to eq('pending authorization')
  end
end
