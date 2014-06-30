class Event < ActiveRecord::Base
	has_attached_file:image
	validates_attachment_content_type :image, :content_type => ["image/jpeg","image/jpg","image/png"]

	has_and_belongs_to_many :users

	#has_one :blog

	extend FriendlyId
  	friendly_id :title, use: :slugged
end
