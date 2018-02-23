class Organization < ApplicationRecord
  has_many :cooks, through: :cooks_organizations
end
