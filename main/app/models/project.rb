class Project < ActiveRecord::Base
	has_attached_file:image
	validates_attachment_content_type :image, :content_type => ["image/jpeg","image/jpg","image/png"]

	belongs_to :team
	has_and_belongs_to_many :users

	has_and_belongs_to_many :donations
	
	extend FriendlyId
  	friendly_id :title, use: :slugged
end
