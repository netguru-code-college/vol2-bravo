class Ingredient < ApplicationRecord
  has_many :dishes_ingredients
  has_many :dishes, through: :dishes_ingredients
  enum kind: {drink: 6, fruit: 5, meat: 4, mushroom: 3, nut: 2, others: 1, vegetable: 0}
end
