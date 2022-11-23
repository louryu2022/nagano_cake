class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { cannot: 0, waiting: 1, production: 2, complete: 3}

  def subtotal
    (price*1.1)*amount
  end

  def with_tax_price
    (price*1.1).floor
  end

end
