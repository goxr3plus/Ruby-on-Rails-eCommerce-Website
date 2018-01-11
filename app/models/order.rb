class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
