class Public::OrdersController < ApplicationController
   # item#show -> orders#new -> orders#confirm -> order#create
  def new
    @order = Order.new(total_payment: params[:total_payment])
    @current_customer = current_customer
    @total = 0
  end

  def confirm
    @order = Order.new(order_params)
    @shipping_cost = 800
    @cart_items = current_customer.cart_items
    @total = 0
    @order.payment_method

    if params[:order][:select_delivery] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_delivery] == "1"
      @order1 = Delivery.find(params[:order][:delivery_id])
      @order.postal_code = @order1.postal_code
      @order.address = @order1.address
      @order.name = @order1.name
    else params[:order][:select_delivery] == "2"
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save!
    @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.price = cart_item.item.price
        @order_detail.amount = cart_item.amount
        @order_detail.item_id = cart_item.item_id
        @order_detail.order_id = @order.id
        @order_detail.save
      end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
  end

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
