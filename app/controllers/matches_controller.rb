class MatchesController < ApplicationController
	# load_and_authorize_resource

	def index
		@matches = Match.all
	end

	def show
		@match = Match.find(params[:id])
	end

	def new
		@match = Match.new
	end

	def edit
		@match = Match.find(params[:id])
	end

	def create
		@match = Match.new(params[:match])
	end

	def destroy
		@match = Match.find(params[:id])
		@match.destroy
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
