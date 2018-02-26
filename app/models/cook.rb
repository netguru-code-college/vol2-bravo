class Cook < ApplicationRecord
  belongs_to :user
  has_many   :organizations, through: :cooks_organizations
  has_many   :proposals,     dependent: :destroy
  has_many   :dishes,        dependent: :destroy
end
