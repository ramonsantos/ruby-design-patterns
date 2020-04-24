# frozen_string_literal: true

require_relative 'servico_facenote_login_stub'

describe LoginByFaceNote do
  it 'returns success to user Gil' do
    params = { user: 'Gil' }
    response = LoginByFaceNote.authenticate(params)
    expect(response[:status]).to be_truthy
    expect(response[:message]).to eq('login successfully')
  end

  it 'returns revoked access for user Ana' do
    params = { user: 'Ana' }
    response = LoginByFaceNote.authenticate(params)
    expect(response[:status]).to be_falsey
    expect(response[:message]).to eq('revoked access')
  end

  it 'returns blocked access for user Celso' do
    params = { user: 'Celso' }
    response = LoginByFaceNote.authenticate(params)
    expect(response[:status]).to be_falsey
    expect(response[:message]).to eq('blocked application')
  end
end
