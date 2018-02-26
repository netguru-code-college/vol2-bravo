class ProposalDecorator < ApplicationDecorator
  delegate_all

  def dish_name
    Dish.all.find_by(id: object.dish_id).name
  end
end
