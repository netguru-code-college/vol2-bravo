class AddQuantityToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :quantity, :string
  end
end
