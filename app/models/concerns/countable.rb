module Countable
  def total
    cart_items.inject(0) { |sum, cart_item| sum + cart_item.count * cart_item.product.price}
  end

  def count
    cart_items.sum(:count)
  end
end