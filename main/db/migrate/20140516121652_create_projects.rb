class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :title,			    :null => false
    	t.integer :team_id,				:null => false
    	t.string :status,			    :null => false
    	t.string :about,	    		:null => false
    	t.string :description,		:null => false
      t.integer :bloggable_id
      t.string :bloggable_type
      t.integer :fundingraised 
      t.integer :fundinggoal 
      t.date :fundingstartdate 
      t.date :fundingenddate
      t.timestamps
    end
  end
end
