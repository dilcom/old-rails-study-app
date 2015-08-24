class StoreController < ApplicationController
  def home
  end

  def about_us
  end

  def index
  	@products = Product.all
  end

  def view_product
  	@product = Product.find(params[:id])
  end
end
