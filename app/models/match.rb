class Match < ActiveRecord::Base
	has_many :comments
  attr_accessible :away_team, :away_team_odds, :away_team_wager, :date, :home_team, :home_team_odds, :home_team_wager, :player1_id, :player2_id, :result
end
