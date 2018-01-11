class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart , dependent: :destroy
  # belongs_to :order

  # LOGIC
  def total_price
    if !quantity.to_s.strip.empty? && !product.price.to_s.strip.empty?
      quantity.to_s.to_d * product.price.to_s.to_d
    else
      0.0
   end
  end
end
