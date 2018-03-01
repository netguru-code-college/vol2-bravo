class ProposalDecorator < ApplicationDecorator
  delegate_all

  def dish_name
    Dish.find(object.dish_id).name
  end

  def nice_date
    object.expiration_date.strftime('%A, %B %e')
  end
end
