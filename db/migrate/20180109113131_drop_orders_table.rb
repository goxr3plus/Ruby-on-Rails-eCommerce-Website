class DropOrdersTable < ActiveRecord::Migration[5.1]
  def change
    table_exists?(:orders) ? drop_table(:orders) : nil
    # drop_table (:orders, if_exists: true)
  end
end
