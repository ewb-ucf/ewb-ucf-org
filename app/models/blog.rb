class Blog < ActiveRecord::Base
	
	#A user may have many blogs and a blog may have many users
	belongs_to :bloggable, :polymorphic => true

	extend FriendlyId
  	friendly_id :username, use: :slugged
end