class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :group
      t.string :img

      t.timestamps
    end
  end
end
