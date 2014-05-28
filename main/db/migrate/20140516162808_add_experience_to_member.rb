class AddExperienceToMember < ActiveRecord::Migration
  def change
    add_column :members, :experience, :text
  end
end
