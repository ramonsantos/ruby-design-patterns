# frozen_string_literal: true

describe Search do
  let(:params) { { kind_of_search: :by_category } }

  it 'creates SearchCriteria using CriteriaFactory' do
    expect(CriteriaFactory).to receive(:create_criteria).with(params)
    Search.by(params)
  end
end
