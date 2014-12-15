class MatchesController < ApplicationController
	load_and_authorize_resource

	def index
		@matches = Match.all
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
	end

	def destroy
		@match.destroy

		redirect_to matches_path
	end

	def update
		if @match.update_attributes(params[:match])
			flash[:notice] = "Successfully updated match"
			redirect_to match_path(@match)
		else 
			render 'edit'
		end
	end

	private

	def match_params
		params.require(:match).permit(:away_team, :home_team, :away_team_odds, :home_team_odds, :away_team_wager, :home_team_wager, :date, :result, :player1_id, :player2_id)
	end
end
