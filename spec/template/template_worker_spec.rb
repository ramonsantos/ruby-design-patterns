# frozen_string_literal: true

describe TemplateWorker do
  let(:error_message) { 'StandardError to execute TemplateWorker' }
  let(:error) { StandardError.new }

  it 'should execute the specified methods and logs errors' do
    expect(Logger).to receive(:error).with(error_message)
    expect(subject).to receive(:perform).with({}).and_raise(error)
    expect(subject).to receive(:try_again?).with(error, {})

    subject.run({})
  end
end
