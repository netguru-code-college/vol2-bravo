class Organization < ApplicationRecord
  has_many :cooks, through: :cooks_organizations
  has_many :users, through: :administrations
  has_many :users, through: :relationships
end
