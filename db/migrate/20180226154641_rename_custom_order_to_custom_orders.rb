class RenameCustomOrderToCustomOrders < ActiveRecord::Migration[5.1]
  def change
    rename_table :custom_order, :custom_orders
  end
end
