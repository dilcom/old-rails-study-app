class PaypalPaymentsController < ApplicationController
  before_action :set_order_and_check_paid, only: [:checkout, :success]

  def checkout
    items = @order.cart_items.map do |cart_item|
      product = cart_item.product
      [ [:name, product.title],
        [:description, product.description],
        [:quantity, cart_item.count],
        [:amount, cart_item.total * 100]
      ]
    end
    items.map!(&:to_h)
    response = PAYPAL_GATEWAY.setup_purchase(@order.total * 100,
      ip: request.remote_ip,
      return_url: paypal_payments_success_url,
      cancel_return_url: paypal_payments_fail_url,
      currency: "USD",
      allow_guest_checkout: true,
      items: items
    )
    redirect_to PAYPAL_GATEWAY.redirect_url_for(response.token)
  end

  def success
    @payment = PaypalPayment.new(express_token: params[:token])
    if @payment.save
      if @payment.purchase(@order, request.remote_ip)
        redirect_to active_order_path, notice: 'Order successfully paid via PayPal.' and return
      end
    end
    redirect_to active_order_path, notice: 'Something went wrong and order left unpaid.'
  end

  def fail
    redirect_to active_order_path, notice: 'Something went wrong and order left unpaid.'
  end
end
