class CartItem < ApplicationRecord
   belongs_to :customer
   belongs_to :admin
   belongs_to :item

   def subtotal
     item.with_tax_price*amount
   end
end
