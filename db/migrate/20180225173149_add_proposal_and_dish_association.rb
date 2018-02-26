class AddProposalAndDishAssociation < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposals, :dish, foreign_key: true
  end
end
