class AddPersonalProjectsToMember < ActiveRecord::Migration
  def change
    add_column :members, :personalprojects, :text
  end
end
