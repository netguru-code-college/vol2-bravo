class CustomOrder < ApplicationRecord
  belongs_to :user
  belongs_to :proposal

  scope :all_orders_for_cook, -> (proposal_ids) { CustomOrder.where(proposal_id: proposal_ids) }
end
