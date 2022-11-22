class Delivery < ApplicationRecord
  belongs_to :customer
  belongs_to :admin

  def delivery_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
