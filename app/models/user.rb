class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one  :cook, dependent: :destroy

  has_many :administrations
  has_many :organizations, through: :administrations

  has_many :relationships
  has_many :followings, through: :relationships, source: :organization

  has_many :custom_orders

  validates :name, :last_name, :live_city, :interesting_city,
            presence: true, allow_nil: true

  def info_completed?
    name.present? && 
    last_name.present? && 
    interesting_city.present? && 
    live_city.present?
  end
end
