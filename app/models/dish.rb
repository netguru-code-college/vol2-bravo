class Dish < ApplicationRecord
  has_many :ingredients, through:dishes_ingredients 
end
