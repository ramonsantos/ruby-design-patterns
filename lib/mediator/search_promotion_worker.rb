# frozen_string_literal: true

class SearchPromotionWorker
  def perform(user)
    MediatorNotifier.products_on_sale(products_of_interest(user))
    update_user_notification
  end

  private

  def products_of_interest(user)
    promotional_products & user.products_of_interest
  end

  def promotional_products
    []
  end

  def update_user_notification
  end
end
