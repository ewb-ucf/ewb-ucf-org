class CreateDonationsProjects < ActiveRecord::Migration
  def change
    create_table :donations_projects do |t|
      t.integer :donation_id
      t.integer :project_id
    end
  end
end
