class AddCookAndDishAssociation < ActiveRecord::Migration[5.1]
  def change
    add_reference :dishes, :cook, foreign_key: true
  end
end
