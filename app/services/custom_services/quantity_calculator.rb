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

# @custom_order
# id: nil,
# quantity: 1,
# receive_date: Sat, 24 Mar 2018 12:33:00 UTC +00:00,
# user_id: 5,
# proposal_id: 5,
# created_at: nil,
# updated_at: nil>

# module LeagueServices
#   class MatchesGenerator
#     attr_accessor :league, :users

#     def initialize(league:)
#       @league = league
#       @users = league.users
#     end

#     def call
#       pairs = calculate_pairs
#       generate_matches(pairs)
#     end

#     private

#     def calculate_pairs
#       player_ids = users.map(&:id)
#       player_ids.combination(2).to_a
#     end

#     def generate_matches(pairs)
#       pairs.each do |pair|
#         Match.create(
#           league_id: league.id,
#           player_1: pair.first,
#           player_2: pair.last
#         )
#       end
#     end
#   end
# end
