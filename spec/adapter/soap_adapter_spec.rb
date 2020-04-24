# frozen_string_literal: true

describe SoapAdapter do
  describe '#preferences' do
    let(:universal_id) { 'FG1234' }
    let(:adapter) { SoapAdapter.new(universal_id) }

    context 'of email' do
      it "returns the client's email list" do
        emails = 'client@client.com, client@email.com'
        allow(adapter).to receive(:fetch_email_preferences) { emails }
        preferences = adapter.preferences
        emails = preferences[:email]
        expect(emails.size).to eq(2)
        expect(emails[0]).to eq('client@client.com')
        expect(emails[1]).to eq('client@email.com')
      end

      it 'returns an empty string if there are no emails' do
        allow(adapter).to receive(:fetch_email_preferences)
        preferences = adapter.preferences
        emails = preferences[:email]
        expect(emails.size).to eq(0)
      end

      it 'validates email' do
        emails = 'client@client.com'
        allow(adapter).to receive(:fetch_email_preferences) { emails }
        expect(Validate).to receive(:email).with(['client@client.com'])
        adapter.preferences
      end
    end

    context 'of address' do
      it 'returns client address' do
        address = 'rua a casa 0'
        allow(adapter).to receive(:fetch_address_preferences) { address }
        preferences = adapter.preferences
        expect(preferences[:address]).to eq('rua a casa 0')
      end

      it 'returns an empty string if no address exists' do
        allow(adapter).to receive(:fetch_address_preferences)
        preferences = adapter.preferences
        expect(preferences[:address]).to eq('')
      end

      it 'validate the address' do
        address = 'rua a casa 0'
        allow(adapter).to receive(:fetch_address_preferences) { address }
        expect(Validate).to receive(:address).with('rua a casa 0')
        adapter.preferences
      end
    end

    context 'of payment' do
      it 'retorns client address' do
        payment = '1234 5678 8765 4321'
        allow(adapter).to receive(:fetch_payment_preferences) { payment }
        preferences = adapter.preferences
        expect(preferences[:payment]).to eq('1234 5678 8765 4321')
      end

      it 'returns an empty string if there are no payment methods' do
        allow(adapter).to receive(:fetch_payment_preferences)
        preferences = adapter.preferences
        expect(preferences[:payment]).to eq('')
      end

      it 'validate the payment' do
        payment = '1234 5678 8765 4321'
        allow(adapter).to receive(:fetch_payment_preferences) { payment }
        expect(Validate).to receive(:payment).with('1234 5678 8765 4321')
        adapter.preferences
      end
    end

    context 'of telephone' do
      it 'retorns client telephones' do
        telephone = '+0123456789, +1234567890'
        allow(adapter).to receive(:fetch_telephone_preferences) { telephone }
        preferences = adapter.preferences
        telephone = preferences[:telephone]
        expect(telephone.size).to eq(2)
        expect(telephone[0]).to eq('+0123456789')
        expect(telephone[1]).to eq('+1234567890')
      end

      it 'returns an empty string if there are no telephones' do
        allow(adapter).to receive(:fetch_telephone_preferences)
        preferences = adapter.preferences
        telephone = preferences[:telephone]
        expect(telephone.size).to eq(0)
      end

      it 'validate the telephone' do
        telephone = '+1234567890'
        allow(adapter).to receive(:fetch_telephone_preferences) { telephone }
        expect(Validate).to receive(:telephone).with(['+1234567890'])
        adapter.preferences
      end
    end
  end
end
