class DashboardController < ApplicationController
  # before_action :authenticate_user!
  def index
    current_user = User.all.first
    users_organization_ids = current_user.followings.map(&:id)
    @proposals_for_organization = Proposal.all_for_organization(users_organization_ids).group_by(&:organization_id)
  end
end
