class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :user_id, :user_id
  end
end
