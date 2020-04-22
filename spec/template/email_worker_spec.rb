# frozen_string_literal: true

describe EmailWorker do
  let(:id_user) { 1 }

  let(:params) do
    {
      user: id_user,
      recipients: recipient_list,
      message: :invite
    }
  end

  context 'when success' do
    let(:email_subject) { 'invite sent by user 1' }
    let(:email) { subject.run(params) }

    let(:recipient_list) do
      [
        'email@email.com',
        'outro_email@email.com',
        'email_qualquer@email.com'
      ]
    end

    it 'should send an email to each recipient' do
      expect(email[:to]).to eq(recipient_list)
      expect(email[:subject]).to eq(email_subject)
      expect(email[:sent_emails]).to eq(3)
    end
  end

  context 'when error' do
    let(:recipient_list) { ['email@email.com'] }
    let(:expected_error_log) { 'Timeout::Error to execute EmailWorker' }

    it 'should manage timeout errors' do
      allow(subject).to receive(:send_email).exactly(5).times.and_raise(Timeout::Error)

      expect { subject.run(params) }.not_to raise_error
    end

    it 'should log errors when sending email' do
      allow(subject).to receive(:send_email).and_raise(Timeout::Error)
      allow(subject).to receive(:try_again).and_return(false)
      expect(Logger).to receive(:error).with(expected_error_log).at_least(1).times

      subject.run(params)
    end

    it 'should send email even after 4 failures' do
      expect(subject).to receive(:send_email).exactly(4).times.and_raise(Timeout::Error)
      expect(subject).to receive(:send_email).once
      expect(Logger).to receive(:error).with(expected_error_log).at_least(1).times

      subject.run(params)
    end
  end
end
