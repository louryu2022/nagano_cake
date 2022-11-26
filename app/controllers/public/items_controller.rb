class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8).order('created_at DESC')
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @current_customer = current_customer
    @cart_item = CartItem.new
  end
end
