class AddCorrectOutcomesToUser < ActiveRecord::Migration
  def change
    add_column :users, :correct_outcomes, :integer
  end
end
