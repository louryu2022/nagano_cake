class Public::DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    redirect_to request.referer
  end

  def update
  end

  def destroy
  end

  private

  def delivery_params
    params.require(:delivery).permit(:customer_id, :name, :postal_code, :address)
  end

end
