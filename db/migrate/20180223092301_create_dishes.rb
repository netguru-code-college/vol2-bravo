class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string  :name
      t.text    :desription
      t.integer :quantity
      t.string  :typeOfKithcen
      t.integer :spicyness
      t.text    :comments

      t.timestamps
    end
  end
end
