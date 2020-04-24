# frozen_string_literal: true

describe Login do
  context 'logging in by FaceNote' do
    it 'uses LoginByFaceNote to authenticate' do
      params =
        {
          method: :facenote,
          data: {
            user: 'Gil'
          }
        }
      expect(LoginByFaceNote).to receive(:authenticate).with(params[:data])
      expect(LoginByZuiter).to receive(:authenticate).never
      Login.with(params)
    end
  end

  context 'logging in via Zuiter' do
    it 'uses LoginByZuiter to authenticate' do
      params =
        {
          method: :zuiter,
          data: {
            user: 'Gil'
          }
        }
      expect(LoginByZuiter).to receive(:authenticate).with(params[:data])
      expect(LoginByFaceNote).to receive(:authenticate).never
      Login.with(params)
    end
  end
end
