class CardPaymentsController < ApplicationController
  before_filter :authenticate_admin!, only: [:index, :show]
  layout 'admin_area', only: [:index, :show]
  before_action :set_order_and_check_paid, only: [:new, :create]

  def index
    @card_payments = CardPayment.all
  end

  def new
    @card_payment = CardPayment.new
  end

  def show
    @card_payment = CardPayment.find(params[:id])
  end

  def create
    card_payment_params = card_params.merge(amount: @order.total)
    @card_payment = CardPayment.new(card_payment_params)

    if @card_payment.save
      if @card_payment.process(@order, request.remote_ip)
        redirect_to active_order_path, notice: "Order succesfully paid." and return
      end
    end
    @card_payment.destroy
    render 'new'
  end

private
  def card_params
    params.require(:card_payment).permit(:first_name, :last_name, :credit_card_number, :expiration_month, :expiration_year, :card_security_code)
  end
end
