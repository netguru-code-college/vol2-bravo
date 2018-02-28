class Cook < ApplicationRecord
  belongs_to :user
  has_many   :cooks_organizations
  has_many   :organizations, through: :cooks_organizations
  has_many   :proposals,     dependent: :destroy
  has_many   :dishes,        dependent: :destroy

  validates :speciality, :work_city, presence: true

  def join(organization)
    organizations << organization
  end

  def exit(organization)
    organizations.delete(organization)
  end

  def member?(organization)
    organizations.include?(organization)
  end
end
