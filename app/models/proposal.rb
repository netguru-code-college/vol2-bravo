class Proposal < ApplicationRecord
  belongs_to :cook
  belongs_to :organization
  belongs_to :dish
  has_many   :transactions
end
