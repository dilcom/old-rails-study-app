class StoreController < ApplicationController
  before_action :set_order, only: [:last_order]
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

  def last_order
  end
end
