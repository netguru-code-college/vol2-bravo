class DashboardController < ApplicationController
  before_action :user_need_to_fill_personal_info, only: [:index]

  def index
    @dashboard = DashboardViewObject.new(current_user)
  end

  private

  def user_need_to_fill_personal_info
    redirect_to edit_user_path(current_user) if current_user.present? && !current_user.info_completed?
  end
end
