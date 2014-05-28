class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email
      t.string :gender
      t.string :pid
      t.integer :points
      t.text    :aboutme
      t.timestamps
    end
  end
end
