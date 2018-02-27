class RenameTransactionToCustomOrder < ActiveRecord::Migration[5.1]
  def change
    rename_table :transactions, :custom_order
  end
end
