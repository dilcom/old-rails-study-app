module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def check_cart_not_empty!
    if @cart.empty?
      redirect_to store_path, notice: 'Your cart is empty. Please add something in it.'
      return false
    else
      return true
    end
  end
end