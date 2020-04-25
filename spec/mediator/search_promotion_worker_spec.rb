# frozen_string_literal: true

describe SearchPromotionWorker do
  it 'should notify about product on sale' do
    products = ['Super Maria Brothers', 'USB Controller']
    user = User.new(email: 'user@email.com', products_of_interest: products)

    allow(subject).to receive(:promotional_products).and_return(products)

    expect(MediatorNotifier).to receive(:products_on_sale).with(products)

    subject.perform(user)
  end

  it 'should only notify products of interest to the user' do
    user_products = ['Super Maria Brothers', 'USB keyboard']
    user = User.new(email: 'user@email.com', products_of_interest: user_products)

    promotional_products = ['Super Maria Brothers', 'USB Controller']
    allow(subject).to receive(:promotional_products).and_return(promotional_products)

    expect(MediatorNotifier).to receive(:products_on_sale).with(['Super Maria Brothers'])

    subject.perform(user)
  end
end
