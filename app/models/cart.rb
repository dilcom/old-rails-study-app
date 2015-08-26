class Cart < ActiveRecord::Base
  has_many :cart_items
  after_destroy :cleanup

  include Countable

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

  private

  def cleanup
    cart_items.where(order_id: nil).delete_all
    cart_items.update_all(cart_id: nil)
  end
end
