class CooksOrganizationsController < ApplicationController
  def create
    @organization = Organization.find(params[:id])
    current_user.cook.join(@organization)
    respond_to do |format|
      format.html { redirect_to @organization }
      format.js
    end
  end

  def destroy
    @organization = CooksOrganization.find(params[:id]).organization
    current_user.cook.exit(@organization)
    respond_to do |format|
      format.html { redirect_to @organization }
      format.js
    end
  end
end
