class CreateDishesIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes_ingredients do |t|
      t.belongs_to :dish
      t.belongs_to :ingredient
      t.timestamps
    end
  end
end
