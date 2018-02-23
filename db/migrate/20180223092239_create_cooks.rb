class CreateCooks < ActiveRecord::Migration[5.1]
  def change
    create_table :cooks do |t|
      t.integer :stars
      t.string :speciality
      t.string :work_city
      t.timestamps
    end
  end
end
