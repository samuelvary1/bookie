class MatchesController < ApplicationController
	def new
	end

	def create
		@match = Match.new(params[:match])

		@match.save
		redirect_to @match
	end

	def show
		@match = Match.find(params[:id])
	end

	def index
		@matches = Match.all
	end

	private

	def match_params
		params.require(:match).permit(:home_team, :away_team, :home_team_odds, :away_team_odds, :home_team_wager, :away_team_wager, :date, :result, :player1_id, :player2_id)
	end
end
