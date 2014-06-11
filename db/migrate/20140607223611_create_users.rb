class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :points
      t.references :champion
    	t.string :striker		
      t.timestamps
    end
  end
end
