class Product < ApplicationRecord
  mount_uploader :picture, ProductPictureUploader
  has_many :line_items, dependent: :destroy
end
