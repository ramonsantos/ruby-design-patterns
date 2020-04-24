# frozen_string_literal: true

class FaceNoteLoginService
  def self.authenticate(dados)
    return 200 if dados[:user] == 'Gil'
    return 403 if dados[:user] == 'Ana'
    return 408 if dados[:user] == 'Celso'

    404
  end
end
