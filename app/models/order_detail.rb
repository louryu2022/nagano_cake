class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { cannot: 0, waiting: 1, production: 2, complete: 3}
  
  def subtotal
    price*amount
  end
end
