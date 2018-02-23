class Organization < ApplicationRecord
  has_many :users, through: :administrations
  has_many :users, through: :relationships
end
