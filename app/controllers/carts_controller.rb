class CartsController < ApplicationController
  before_action :set_cart_item, only: [:inc, :dec, :remove_cart_item]
  before_filter :check_cart_not_empty!, only: [:show]

  # GET /cart
  def show
    @order = Order.new
  end

  # POST cart/add_product/:id
  def add_product
    @cart.add_product(cart_params[:id])
    redirect_to store_path, notice: 'Item successfully added.'
  end

  # DELETE cart/cart_item/:id
  def remove_cart_item
    @cart_item.destroy if @cart_item
    if @cart.cart_items.any?
      redirect_to cart_path, notice: 'Item successfully removed.'
    else
      redirect_to store_path, notice: 'Item successfully removed.'
    end
  end

  # DELETE /cart
  def destroy
    @cart.destroy
    redirect_to store_path, notice: 'Cart was successfully cleared.'
  end

  # GET cart/inc_cart_item/:id
  def inc
    @cart_item.inc if @cart_item
    redirect_to cart_path, notice: 'Item successfully added.'
  end

  # GET cart/dec_cart_item/:id
  def dec
    @cart_item.dec if @cart_item
    if @cart.cart_items.any?
      redirect_to cart_path, notice: 'Item successfully removed.'
    else
      redirect_to store_path, notice: 'Item successfully removed.'
    end
  end

  private

  def set_cart_item
    @cart_item = @cart.find_in_cart_items(cart_params[:id])
  end

  def cart_params
    params.permit(:id)
  end
end
