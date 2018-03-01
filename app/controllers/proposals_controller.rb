class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    @dishes = current_user.cook.dishes.collect { |e| [e.name, e.id] }
    @proposal = Proposal.new
    @organization = Organization.all.find(params[:organization_id])
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.cook_id = Dish.find(params[:proposal][:dish_id]).cook.id
    if @proposal.save
      redirect_to organization_proposal_path(params[:organization_id], @proposal)
    else
      render 'new'
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def edit
    @dishes = current_user.cook.dishes.collect { |e| [e.name, e.id] }
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update_attributes(proposal_params)
      redirect_to organization_proposals_path(current_user.cook, @proposal)
    else
      render 'edit'
    end
  end

  def destroy
    @organization = Organization.all.find(params[:organization_id])
    @proposal = Proposal.find(params[:id])
    @proposal.destroy
    flash[:success] = 'Zamównienie zostało usunięte'
    redirect_to action: 'index', organization_id: @organization.id
  end

  private

  def proposal_params
    params.require(:proposal).permit(:price, :expiration_date, :quantity, :dish_id)
          .merge(organization_id: params[:organization_id])
  end
end
