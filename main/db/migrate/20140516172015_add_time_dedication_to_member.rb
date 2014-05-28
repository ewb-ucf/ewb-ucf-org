class AddTimeDedicationToMember < ActiveRecord::Migration
  def change
    add_column :members, :timededication, :string
  end
end
