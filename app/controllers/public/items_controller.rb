class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @current_customer = current_customer
    @cart_item = CartItem.new
  end
end
