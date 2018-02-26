class Proposal < ApplicationRecord
  belongs_to :organization
  belongs_to :dish
  has_many   :transactions

  scope :all_for_organization, -> (organization_ids) { Proposal.where(organization_id: organization_ids) }
end
