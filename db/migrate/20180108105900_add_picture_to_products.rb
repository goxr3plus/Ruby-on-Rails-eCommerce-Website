class AddPictureToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :picture, :string
  end
end
