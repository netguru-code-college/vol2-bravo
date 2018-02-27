class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_organization

  def show
    set_organization #@organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.save
    redirect_to @organization
  end

  def edit
    set_organization
  end

  def update
    set_organization
    if @organization.update_attributes(organization_params)
      redirect_to edit_organization_path(@organization), notice: "Organization updated!"
    else
      render 'edit'
    end
  end

  def destroy
    set_organization
    @organization.destroy
    redirect_to new_user_registration_path, notice: "Organization deleted!"
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :city, :description, :private_type)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
