class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :city
      t.text :description
      t.boolean :private_type
      t.timestamps
    end
  end
end
