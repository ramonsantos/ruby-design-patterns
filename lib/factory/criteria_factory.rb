# frozen_string_literal: true

class CriteriaFactory
  def self.create_criteria(params)
    if params[:kind_of_search] == :promotional
      create_promotional(params)
    elsif params[:kind_of_search] == :by_category
      create_by_category(params)
    else
      create_normal_search(params)
    end
  end

  private

  def self.create_promotional(params)
    SearchCriteria.new.tap do |criteria|
      criteria.per_page = results_per_page(params)
      criteria.category = :on_promotion
      criteria.sort_by = :most_recent
    end
  end

  def self.create_by_category(params)
    return create_normal_search(params) if params[:category].nil?

    SearchCriteria.new.tap do |criteria|
      criteria.per_page = results_per_page(params)
      criteria.category = params[:category]
      criteria.sort_by = params[:sort_by] || :most_recent
    end
  end

  def self.create_normal_search(params)
    SearchCriteria.new.tap do |criteria|
      criteria.per_page = results_per_page(params)
      criteria.category = params[:category] || :all
      criteria.sort_by = params[:sort_by] || :relevance
    end
  end

  def self.results_per_page(params)
    params[:results_per_page] || 15
  end
end
