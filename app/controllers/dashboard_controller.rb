class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @following_organizations = current_user
  end

  def user_view
  end

  def cook_view
  end
end
