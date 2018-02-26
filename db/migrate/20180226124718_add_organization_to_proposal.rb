class AddOrganizationToProposal < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposals, :organization, foreign_key: true
  end
end
