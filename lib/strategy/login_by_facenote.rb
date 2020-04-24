# frozen_string_literal: true

class LoginByFaceNote
  FACE_NOTE_SUCCESS  = 200
  FACE_NOTE_REPEALED = 403
  FACE_NOTE_BLOCKED  = 408

  class << self
    def authenticate(params)
      status, message = build_response(FaceNoteLoginService.authenticate(params))

      { status: status, message: message }
    end

    private

    def build_response(response)
      case response
      when FACE_NOTE_SUCCESS
        [true, 'login successfully']
      when FACE_NOTE_REPEALED
        [false, 'revoked access']
      when FACE_NOTE_BLOCKED
        [false, 'blocked application']
      else
        [false, 'unable to authenticate']
      end
    end
  end
end
