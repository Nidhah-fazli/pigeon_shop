class Basket < ApplicationRecord
  has_many :items
  has_many :products, through: :items

  def sub_total
    sum = 0
    self.items.each do |item|
      sum+= item.total_price
    end
    sum
  end
end
