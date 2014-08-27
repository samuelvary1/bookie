class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.integer :home_team_odds
      t.integer :away_team_odds
      t.integer :home_team_wager
      t.integer :away_team_wager
      t.string :date
      t.string :result
      t.integer :player1_id
      t.integer :player2_id

      t.timestamps
    end
  end
end
