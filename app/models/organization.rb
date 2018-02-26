class Organization < ApplicationRecord
  has_many :cooks,     through: :cooks_organizations
  has_many :admins,    through: :administrations, source: :user
  has_many :followers, through: :relationships, source: :user
  has_many :proposals
end
