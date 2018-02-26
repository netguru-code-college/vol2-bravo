class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :quantity
      t.datetime :receive_date
      t.belongs_to :user
      t.belongs_to :proposal
      t.timestamps
    end
  end
end
