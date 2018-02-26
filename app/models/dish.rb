class Dish < ApplicationRecord
  has_many   :ingredients, through: :dishes_ingredients 
  has_many   :proposals
  belongs_to :cook
end
