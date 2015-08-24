class Cart < ActiveRecord::Base
  has_many :cart_items

  def total
  	cart_items.inject(0) { |sum, cart_item| sum + cart_item.count * cart_item.product.price}
  end

  def count
  	cart_items.sum(:count)
  end

  def empty?
  	cart_items.empty?
  end

  def add_product(product_id)
    current_item = cart_items.find_by(product_id: product_id)
    if current_item
      current_item.count += 1
      current_item.save
    else
      current_item = cart_items.create(product_id: product_id, cart_id: id)
    end
    current_item
  end
end
