# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

Dir['lib/**/*.rb'].each { |file| require_relative "../#{file}" }

RSpec.configure do |config|
  config.mock_framework = :rspec
  config.full_backtrace = true
end
