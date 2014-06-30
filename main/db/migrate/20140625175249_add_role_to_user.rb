class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :bio, 			:text
    add_column :users, :dob, 			:string
    add_column :users, :firstname, 		:string
    add_column :users, :lastname, 		:string
    add_column :users, :major, 			:string
    add_column :users, :minor, 			:string
    add_column :users, :subscription, 	:string
    add_column :users, :cvlink,         :string
    add_column :users, :resumelink,     :string
    add_column :users, :mysitelink,     :string
    add_column :users, :graduation,     :string

    add_column :users, :role,           :string

  end
end
