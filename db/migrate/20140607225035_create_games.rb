class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :actual_score_team1
      t.integer :actual_score_team2
      t.integer :team1_id
      t.integer :team2_id
      t.integer :stage
      
      t.timestamps
    end
  end
end
