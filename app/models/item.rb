class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  def with_tax_price
    (price*1.1).floor
  end

  def add_tax_price
    (self.price * 1.1).round
  end

end
