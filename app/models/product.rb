class Product < ApplicationRecord

  mount_uploader :picture, ProductPictureUploader

end
