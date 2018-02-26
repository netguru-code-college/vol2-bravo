class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one  :cook,          dependent: :destroy

  has_many :organizations, through: :administrations
  has_many :following,     through: :relationships, source: :organization
  
  has_many :transactions
end
