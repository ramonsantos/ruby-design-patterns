# frozen_string_literal: true

class Search
  def self.by(params)
    criteria = CriteriaFactory.create_criteria(params)
    result_ids = SearchService.search_with(criteria)
    find_products_by_ids(result_ids)
  end

  private

  def self.find_products_by_ids(ids)
  end
end
