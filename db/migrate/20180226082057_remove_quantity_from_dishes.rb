class RemoveQuantityFromDishes < ActiveRecord::Migration[5.1]
  def change
    remove_column :dishes, :quantity, :string
  end
end
