class AdminArea::OrdersController < ApplicationController
  before_filter :authenticate_admin!, except: [:create, :new, :destroy]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :check_order_owner!, only: [:destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    params = order_params.merge(cart_items: @cart.cart_items)
    @order = Order.new(params)

    respond_to do |format|
      if @order.save
        session[:order] = @order.id
        @cart.destroy
        format.html { render :show, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render 'carts/show' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      if admin_signed_in?
        format.html { redirect_to orders_path, notice: 'Order was successfully destroyed.' }
      else        
        format.html { redirect_to store_path, notice: 'Order was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:email, :name, :country, :state, :city, :address_line_1, :address_line_2, :postal_code, :phone)
    end

    def check_order_owner!
      return true if session[:order] == @order.id && !@order.paid?
      authenticate_admin!
    end
end
