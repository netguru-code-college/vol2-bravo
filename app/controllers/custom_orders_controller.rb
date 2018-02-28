class CustomOrdersController < ApplicationController


  def new
    @custom_order = CustomOrder.new
    @proposal = Proposal.find(params[:proposal_id])
    # @dishes = current_user.cook.dishes.collect { |e| [e.name, e.id] }

    @quantity = (1..@proposal.quantity.to_i).to_a #.collect { |q| [q, q]}
    # binding.pry
  end

  def create
    @custom_order = CustomOrder.new(custom_order_params)
    if @custom_order.save
      # service - obliczanie nowej ilosci propsal
      redirect_to root_path
    else
      redirect_to custom_order_path(params[:proposal_id])
    end
  end

  private

  def custom_order_params
    params.require(:custom_order).permit(:quantity, :receive_date).merge(user_id: current_user.id).merge(proposal_id: params[:proposal_id])
  end
end
