class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :USER_ID, :user_id
  end
end
