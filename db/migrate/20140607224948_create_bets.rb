class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
    	t.references :user
    	t.references :game    	
    	t.integer :score_team1
      t.integer :score_team2
      t.timestamps
    end
  end
end
