class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :item_id, :count, presence: true
  validates :count, numericality:{ only_integer: true }

  def sum_of_price
    item.taxin_price * count
  end

end
