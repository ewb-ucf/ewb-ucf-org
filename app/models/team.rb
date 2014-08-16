class Team < ActiveRecord::Base
	has_and_belongs_to_many :users
	#has_one :application
	
	has_many :projects
end
