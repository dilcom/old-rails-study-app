class StoreController < ApplicationController
  before_action :set_order, only: [:active_order]
  def home
  end

  def about_us
  end

  def index
  	@products = Product.all.includes(:pictures)
  end

  def view_product
  	@product = Product.find(params[:id])
  end

  def active_order
  end

  def contact_us
    @feedback = Feedback.new
  end
end
