module CustomServices
  class QuantityCalculator
    def initialize(custom_order)
      @custom_order = custom_order
      @proposal = Proposal.find(@custom_order.proposal_id)
    end

    def call
      calculate_new_quantity_of_proposal
    end

    private

    def calculate_new_quantity_of_proposal
      proposal_quantity = @proposal.quantity.to_i
      new_quantity = proposal_quantity - @custom_order.quantity
      @proposal.update_attribute(:quantity, new_quantity)
    end
  end
end
