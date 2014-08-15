class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
    	t.integer 	:amount
      t.text 		:comment
      t.string 	:donorname
      t.string 	:companyname
      t.boolean :recurring
      t.integer 	:project_id

    	t.timestamps
    end
  end
end
