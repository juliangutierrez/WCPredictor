class AddWinnerByPenaltiesToGame < ActiveRecord::Migration
  def change
  	add_column :games, :winner_id, :integer
  end
end
