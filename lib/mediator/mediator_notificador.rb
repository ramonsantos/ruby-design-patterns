# frozen_string_literal: true

class MediatorNotifier
  def self.products_on_sale(products)
    CustomerNotifier.products_on_sale(products)
    SupplierNotifier.products_on_sale(products)
  end
end
