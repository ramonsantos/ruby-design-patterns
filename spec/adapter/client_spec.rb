# frozen_string_literal: true

describe Client do
  context '#preferences' do
    context 'of email' do
      let(:preferences) do
        {
          email: ['client@cliente.com'],
          address: 'rua 0 casa 1',
          payment: '1234 5678 8765 4321',
          telephone: ['+0123456789']
        }
      end

      it "returns the customer's email list" do
        universal_id = 'FG1234'
        adapter = SoapAdapter.new(universal_id)
        client = Client.new(universal_id, adapter)
        allow(adapter).to receive(:preferences) { preferences }
        preferences = JSON.parse(client.preferences)
        expect(preferences['email'].first).to eq('client@cliente.com')
        expect(preferences['address']).to eq('rua 0 casa 1')
        expect(preferences['payment']).to eq('1234 5678 8765 4321')
        expect(preferences['telephone'].first).to eq('+0123456789')
      end
    end
  end
end
