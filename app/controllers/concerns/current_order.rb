module CurrentOrder
  extend ActiveSupport::Concern

  private

  def set_order
    @order = Order.find_by_id(session[:order])
    unless @order
      redirect_to store_path, notice: 'No active order in this session.' and return
    end
  end

  def set_order_and_check_paid
    set_order
    if @order.paid?
      redirect_to active_order_path, notice: 'Your order is already paid.' and return
    end
  end
end