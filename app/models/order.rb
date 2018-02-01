class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # enum pay_method: {
  #   'Check' => 0,
  #   'Credit card' => 1,
  #   'Purchase order' => 2
  # }
  belongs_to :user
  # validates :pay_method, :description, presence: true
  # validates :pay_method, inclusion: pay_methods.keys

  # LOGIC
  def sub_total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.total_price
    end
    sum
  end

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
