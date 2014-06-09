class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score_team1
      t.integer :score_team2
      t.integer :team1_id
      t.integer :team2_id
      t.belongs_to :bet

      t.timestamps
    end
  end
end
