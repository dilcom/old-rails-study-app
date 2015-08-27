class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  validates :product_id, presence: true

  def inc
    self.count += 1
    save
  end

  def dec
    if self.count > 1
      self.count -= 1
      save
    else
      destroy
    end
  end

  def total
    self.count * self.product.price
  end
end
