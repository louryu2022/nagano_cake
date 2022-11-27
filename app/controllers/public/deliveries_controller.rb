class Public::DeliveriesController < ApplicationController
  def index
    @deliveries = current_customer.deliveries
    @delivery = Delivery.new
    @current_customer = current_customer
  end

  def edit
    @delivery = Delivery.find(params[:id])
    @current_customer = current_customer
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to request.referer
    else
      @deliveries = Delivery.all
      @current_customer = current_customer
      render :index
    end
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path(@delivery.id)
    else
      render :edit
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:customer_id, :name, :postal_code, :address)
  end

end
