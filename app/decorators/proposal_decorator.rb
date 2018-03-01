class ProposalDecorator < ApplicationDecorator
  delegate_all

  def dish_name
    Dish.find(object.dish_id).name
  end
end
