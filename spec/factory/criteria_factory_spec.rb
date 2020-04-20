# frozen_string_literal: true

describe CriteriaFactory do
  describe '.create_criteria' do
    context 'for normal search' do
      it 'returns 15 results, by relevance and all categories' do
        params = { product: 'some product' }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.per_page).to eq(15)
        expect(criteria.sort_by).to eq(:relevance)
        expect(criteria.category).to eq(:all)
      end

      it 'returns result per page when specified' do
        params = { product: 'some product', results_per_page: 20 }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.per_page).to eq(20)
      end

      it 'returns sorted when specified' do
        params = { product: 'some product', sort_by: :most_recent }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.sort_by).to eq(:most_recent)
      end

      it 'returns category when specified' do
        params = { product: 'some product', category: 'some category' }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.category).to eq('some category')
      end
    end

    context 'for promotional search' do
      it 'returns 15 results sorted by most recent in category on promotion' do
        params = { product: 'some product', kind_of_search: :promotional }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.per_page).to eq(15)
        expect(criteria.sort_by).to eq(:most_recent)
        expect(criteria.category).to eq(:on_promotion)
      end

      it 'returns result per page when specified' do
        params = { product: 'some product', kind_of_search: :promotional, results_per_page: 20 }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.per_page).to eq(20)
      end

      it 'returns sorted by most recent' do
        params = { product: 'some product', kind_of_search: :promotional, sort_by: :relevance }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.sort_by).to eq(:most_recent)
      end

      it 'returns using category on promotion' do
        params = { product: 'some product', kind_of_search: :promotional, category: :on_promotion }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.category).to eq(:on_promotion)
      end
    end

    context 'for search by category' do
      it 'returns 15 results sorted by most recent in the specified category' do
        params = { product: 'some product', kind_of_search: :by_category, category: 'some category' }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.per_page).to eq(15)
        expect(criteria.sort_by).to eq(:most_recent)
        expect(criteria.category).to eq('some category')
      end

      it 'returns result per page when specified' do
        params = { product: 'some product', kind_of_search: :by_category, category: 'some category', results_per_page: 20 }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.per_page).to eq(20)
      end

      it 'returns order when specified' do
        params = { product: 'some product', kind_of_search: :by_category, category: 'some category', sort_by: :relevance }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.sort_by).to eq(:relevance)
      end

      it 'uses normal search when category is not specified' do
        params = { product: 'some product', kind_of_search: :by_category }
        criteria = CriteriaFactory.create_criteria(params)
        expect(criteria.sort_by).to eq(:relevance)
        expect(criteria.category).to eq(:all)
      end
    end
  end
end
