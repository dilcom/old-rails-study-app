class CartsController < ApplicationController
  before_action :set_cart_item, only: [:inc, :dec, :remove_cart_item]
  # GET /cart
  def show
  end

  def add_product
    @cart.add_product(cart_params[:product_id])
    redirect_to store_path, notice: 'Item successfully added.'
  end

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
    respond_to do |format|
      format.html { redirect_to store_path, notice: 'Cart was successfully cleared.' }
      format.json { head :no_content }
    end
  end

  def inc
    @cart_item.inc if @cart_item
    redirect_to cart_path, notice: 'Item successfully added.'
  end

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
    @cart_item = @cart.cart_items.find_by_id(cart_params[:cart_item_id])
  end

  def cart_params
    params.permit(:product_id, :cart_item_id)
  end
end
