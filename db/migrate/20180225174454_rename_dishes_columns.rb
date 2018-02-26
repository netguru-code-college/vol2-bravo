class RenameDishesColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :dishes, :desription, :description
    rename_column :dishes, :typeOfKithcen, :type_of_kitchen
  end
end
