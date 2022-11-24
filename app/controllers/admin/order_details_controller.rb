class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    
    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.making_status == "production"# 制作ステータスを「制作中」に変えると、注文ステータスが「制作中」に変わる
      
      @order_details.each do |order_detail|# 紐付いている注文商品の製作ステータスを一つ一つeach文で確認していく
        if order_detail.making_status != "complete"# 製作ステータスが「製作完了」ではない場合
          is_updated = false# 上記で定義してあるis_updatedを「false」に変更する
        end
      end
      @order.update(status: 3) if is_updated == true# is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新される　　　=は代入、==は比較
    end
    redirect_to admin_order_path(@order)
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end