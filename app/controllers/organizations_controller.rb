class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  def show
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
  end

  def update
    if @organization.update_attributes(organization_params)
      redirect_to edit_organization_path(@organization), notice: 'Organizacja zaktualizowana'
    else
      render 'edit'
    end
  end

  def destroy
    @organization.destroy
    redirect_to new_user_registration_path, notice: 'Organizacja usunięta!'
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :city, :description, :private_type)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
