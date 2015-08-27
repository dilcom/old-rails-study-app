module ApplicationHelper
  def currency(number)
  	number_to_currency(number, precision: 2, unit: '$')
  end

  def active_order_exists?
    @order = Order.find(session[:order])
    true
  rescue ActiveRecord::RecordNotFound
    false
  end
end
