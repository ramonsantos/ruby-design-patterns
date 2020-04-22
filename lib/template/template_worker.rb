# frozen_string_literal: true

require_relative 'logger'

class TemplateWorker
  attr_reader :logger

  def run(params)
    before_run(params)

    begin
      result = perform(params)
    rescue StandardError => e
      handle_exception(e, params)
      @logger.error("#{e.class} to execute #{self.class}")

      retry if try_again?(e, params)
    end

    result
  end

  def before_run(_params)
    @logger = Logger
  end

  def handle_exception(exception, _params); end
end
