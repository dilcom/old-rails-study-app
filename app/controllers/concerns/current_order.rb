module CurrentOrder
  extend ActiveSupport::Concern

  private

  def set_order
    @order = Order.find_by_id(session[:order])
    unless @order
      redirect_to store_path, notice: 'Please order something before payment.' and return
    end
    if @order.paid?
      redirect_to store_path, notice: 'Your order is already paid.' and return
    end
  end
end