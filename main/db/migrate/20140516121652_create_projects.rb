class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :title,			:null => false
    	t.integer :team_id,				:null => false
    	t.string :status,			:null => false
    	t.string :about,			:null => false
    	t.string :description,		:null => false
      t.timestamps
    end
  end
end
