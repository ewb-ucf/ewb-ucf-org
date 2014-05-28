class AddOtherInvolvementToMember < ActiveRecord::Migration
  def change
    add_column :members, :otherinvolvement, :string
  end
end
