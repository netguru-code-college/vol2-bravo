class AddCookIdToProposals < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposals, :cook, foreign_key: true
  end
end
