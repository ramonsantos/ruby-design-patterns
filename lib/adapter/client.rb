# frozen_string_literal: true

require 'json'

class Client
  attr_reader :universal_id, :adapter

  def initialize(universal_id, adapter)
    @universal_id = universal_id
    @adapter = adapter
  end

  def preferences
    @adapter.preferences.to_json
  end
end
