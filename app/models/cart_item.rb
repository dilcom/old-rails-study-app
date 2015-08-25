class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  validates :product_id, presence: true

  before_destroy :ensure_not_referenced_by_an_order

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

  private

  def ensure_not_referenced_by_an_order
    order.nil?
  end
end
