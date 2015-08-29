class PaypalPaymentsController < ApplicationController
  before_filter :authenticate_admin!, only: [:index, :show]
  before_action :set_order_and_check_paid, only: [:new, :success, :fail]
  layout 'admin_area', only: [:index, :show]

  def index
    @paypal_payments = PaypalPayment.all
  end

  def show
    @paypal_payment = PaypalPayment.find(params[:id])
  end

  def new
    response = PAYPAL_GATEWAY.setup_purchase(@order.total * 100,
      ip: request.remote_ip,
      return_url: paypal_success_url,
      cancel_return_url: paypal_fail_url,
      currency: "USD",
      allow_guest_checkout: true,
      items: @order.paypal_items
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
