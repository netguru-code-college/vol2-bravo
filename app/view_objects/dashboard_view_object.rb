class DashboardViewObject
  def initialize(current_user)
    @current_user = current_user
  end

  def followed_organizations
    @current_user.followings
  end

  def custom_orders_hash
    custom_orders = {}
    @current_user.custom_orders.each do |order|
      proposal = Proposal.find(order.proposal_id)
      custom_orders[order.id] = { proposal: Proposal.find(order.proposal_id).decorate.dish_name,
                                  quantity: order.quantity,
                                  receive_date: order.receive_date,
                                  cook: User.find(Cook.find(proposal.cook_id).user_id).name }
    end
    custom_orders
  end

  def cook_proposals
    @current_user.cook.proposals.group_by(&:organization_id)
  end

  def cook_orders_hash
    cook_proposals_ids = @current_user.cook.proposals.map(&:id)
    cook_orders = CustomOrder.all_orders_for_cook(cook_proposals_ids)
    orders = {}
    cook_orders.each do |order|
      orders[order.id] = { proposal:  Proposal.find(order.proposal_id).decorate.dish_name,
                           quantity: order.quantity,
                           receive_date: order.receive_date,
                           user: User.find(order.user_id).name }
    end
    orders
  end

  def cook_dishes
    @current_user.cook.dishes
  end
end
