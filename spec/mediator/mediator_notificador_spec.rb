# frozen_string_literal: true

describe MediatorNotifier do
  let(:products) { ['Super Maria Brothers', 'USB Controller'] }

  it 'must notify Customer and Supplier of promotional products' do
    expect(CustomerNotifier).to receive(:products_on_sale).with(products)
    expect(SupplierNotifier).to receive(:products_on_sale).with(products)
    MediatorNotifier.products_on_sale(products)
  end
end
