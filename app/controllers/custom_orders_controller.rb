class CustomOrdersController < ApplicationController
  def new
    @custom_order = CustomOrder.new
    @proposal = Proposal.find(params[:proposal_id])
    @quantity = (1..@proposal.quantity.to_i).to_a
  end

  def create
    @custom_order = CustomOrder.new(custom_order_params)
    if @custom_order.save
      # TODO- service
      redirect_to root_path
    else
      redirect_to custom_order_path(params[:proposal_id])
    end
  end

  private

  def custom_order_params
    params.require(:custom_order).permit(:quantity, :receive_date).merge(user_id: current_user.id)
          .merge(proposal_id: params[:proposal_id])
  end
end
