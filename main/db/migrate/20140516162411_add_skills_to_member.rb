class AddSkillsToMember < ActiveRecord::Migration
  def change
    add_column :members, :skills, :text
  end
end
