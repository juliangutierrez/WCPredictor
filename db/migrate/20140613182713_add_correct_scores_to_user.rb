class AddCorrectScoresToUser < ActiveRecord::Migration
  def change
    add_column :users, :correct_scores, :integer
  end
end
