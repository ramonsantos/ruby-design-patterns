# frozen_string_literal: true

require 'timeout'
require_relative 'logger'
require_relative 'template_worker'

class EmailWorker < TemplateWorker
  attr_reader :timeout_limit, :retry_limit, :attempt_counter

  protected

  def perform(params)
    user = find_user(params[:user])
    body = build_message(params[:message], user)
    subject = build_subject(params[:message], user)

    Timeout.timeout(@timeout_limit) do
      send_email(
        from: user,
        to: params[:recipients],
        subject: subject,
        body: body
      )
    end
  end

  def before_run(params)
    super(params)

    @timeout_limit = 10
    @retry_limit = 5
    @attempt_counter = 0
  end

  def try_again?(_exception, _params)
    @attempt_counter += 1
    @attempt_counter < @retry_limit
  end

  private

  def build_message(message_kind, user)
    "email body from #{message_kind} sent by #{user}"
  end

  def build_subject(message_kind, user)
    "#{message_kind} sent by #{user}"
  end

  def send_email(params)
    {
      to: params[:to],
      subject: params[:subject],
      sent_emails: params[:to].size
    }
  end

  def find_user(user_id)
    "user #{user_id}"
  end
end
