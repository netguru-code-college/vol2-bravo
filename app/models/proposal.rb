class Proposal < ApplicationRecord
  # attr_accessor :quantity

  belongs_to :organization
  belongs_to :dish
  has_many   :custom_orders

  scope :all_for_organization, ->(organization_ids) { Proposal.where(organization_id: organization_ids) }
end
