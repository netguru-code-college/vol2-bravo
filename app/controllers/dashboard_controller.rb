class DashboardController < ApplicationController
  before_action :user_need_to_fill_personal_info, only: [:index]

  def index
    # users_organization_ids = current_user.followings.map(&:id) if current_user
    # @proposals_for_organization = Proposal.all_for_organization(users_organization_ids).group_by(&:organization_id)
    # @custom_orders = current_user.custom_orders.take(10) if current_user
    if current_user
      @followed_organizations = current_user.followings
      @custom_orders = create_custom_order_object
    end
  end

  private

  def create_custom_order_object
    orders = Hash.new
    current_user.custom_orders.each do |order|
      orders[order.id] = {proposal: Proposal.find(order.proposal_id).decorate.dish_name,
                          quantity: order.quantity,
                          receive_date: order.receive_date}
    end
    orders
  end

  def user_need_to_fill_personal_info
    if current_user.present?
      redirect_to edit_user_path(current_user) unless current_user.info_completed?
    end
  end
end
