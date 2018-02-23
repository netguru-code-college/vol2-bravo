class AddBasicColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :live_city, :string
    add_column :users, :interesting_city, :string
  end
end
