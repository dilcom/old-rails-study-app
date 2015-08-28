class Product < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy
  has_many :cart_items
  before_destroy :ensure_not_referenced_by_any_cart_item

  def images=(files)
    files.each do |file|
      Picture.create(image: file, product: self)
    end
  end

  private

  def ensure_not_referenced_by_any_cart_item
    if cart_items.empty?
      return true
    else
      errors.add(:base, 'Product already exists in a cart')
      return false
    end
  end
end
