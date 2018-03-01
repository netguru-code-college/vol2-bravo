class RelationshipsController < ApplicationController
  def create
    @organization = Organization.find(params[:id])
    current_user.follow(@organization)
    respond_to do |format|
      format.html { redirect_to @organization }
      format.js
    end
  end

  def destroy
    @organization = Relationship.find(params[:id]).organization
    current_user.unfollow(@organization)
    respond_to do |format|
      format.html { redirect_to @organization }
      format.js
    end
  end
end
