class AddDescriptionAndPayMethodToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :description, :string , default: '   '
    add_column :orders, :pay_method, :string  , default: ' $ '
  end
end
