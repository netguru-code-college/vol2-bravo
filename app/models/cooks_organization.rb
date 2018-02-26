class CooksOrganization < ApplicationRecord
  belongs_to :cook
  belongs_to :organization
end
