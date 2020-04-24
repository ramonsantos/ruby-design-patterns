# frozen_string_literal: true

class FaceNoteLoginService
  def self.authenticate(data)
    response = authenticate_by_post(data[:user])
    response.status
  rescue TimeoutException
    log.error('Timeout when logging in via FaceNote')
  end
end
