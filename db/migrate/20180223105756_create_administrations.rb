class CreateAdministrations < ActiveRecord::Migration[5.1]
  def change
    create_table :administrations do |t|
      t.belongs_to :user
      t.belongs_to :organization
      t.timestamps
    end
  end
end
