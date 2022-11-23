class Order < ApplicationRecord
   has_many :order_details, dependent: :destroy

   belongs_to :customer

  def set_date
    created_at.strftime("%Y/%m/%d %H:%M:%S")
  end


  def full_name
    self.first_name + self.last_name
  end

  enum status: { waiting: 0, confirmation: 1, production: 2, preparation: 3, sent: 4}
  enum payment_method: { credit_card: 0, transfer: 1 }

end
