class Proposal < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :organization
  belongs_to :dish
  has_many   :custom_orders

  scope :all_for_organization, ->(organization_ids) { Proposal.where(organization_id: organization_ids) }
end
