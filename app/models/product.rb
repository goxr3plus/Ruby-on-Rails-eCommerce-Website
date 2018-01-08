class Product < ApplicationRecord
  mount_uploader :picture, ProductPictureUploader
  # belongs_to :order

end
