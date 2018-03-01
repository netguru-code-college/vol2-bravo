class CustomOrder < ApplicationRecord
  # attr_accessor :quantity

  belongs_to :user
  belongs_to :proposal

  scope :all_orders_for_cook, ->(proposal_ids) { CustomOrder.where(proposal_id: proposal_ids) }

  validates :quantity, :receive_date, presence: true
end
