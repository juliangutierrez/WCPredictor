class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score_team_1
      t.integer :score_team_2

      t.timestamps
    end
  end
end
