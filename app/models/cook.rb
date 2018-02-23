class Cook < ApplicationRecord
  has_one :user
  has_many :organizations, through: :cooks_organizations
end
