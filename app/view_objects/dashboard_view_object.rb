class DashboardViewObject
  def initialize(current_user)
    @current_user = current_user
  end

  def followed_organizations
    @current_user.followings
  end

  def custom_orders_hash
    @current_user.custom_orders.reverse.each_with_object({}) do |order, hsh|
      proposal = Proposal.find(order.proposal_id)
      hsh[order.id] = { proposal: proposal.decorate.dish_name,
                        quantity: order.quantity,
                        receive_date: order.receive_date.strftime('%d/%m/%Y %H:%M'),
                        cook: User.find(Cook.find(proposal.cook_id).user_id).name }
    end
  end

  def cook_proposals
    @current_user.cook.proposals.group_by(&:organization_id)
  end

  def cook_orders_hash
    cook_proposals_ids = @current_user.cook.proposals.map(&:id)
    cook_orders = CustomOrder.all_orders_for_cook(cook_proposals_ids)
    cook_orders.reverse.each_with_object({}) do |order, hsh|
      proposal = Proposal.find(order.proposal_id)
      hsh[order.id] = { proposal: proposal.decorate.dish_name,
                        quantity: order.quantity,
                        receive_date: order.receive_date.strftime('%d/%m/%Y %H:%M'),
                        user: User.find(order.user_id).name }
    end
  end

  def cook_dishes
    @current_user.cook.dishes
  end
end
