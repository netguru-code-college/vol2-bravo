class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.float :price
      t.datetime :expiration_date
      t.timestamps
    end
  end
end
