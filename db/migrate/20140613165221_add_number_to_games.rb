class AddNumberToGames < ActiveRecord::Migration
  def change
    add_column :games, :number, :integer
  end
end
