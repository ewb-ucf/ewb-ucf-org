class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password, length: { minimum: 8 }
  validates_confirmation_of :password, message: "passwords should match", if: :password
  
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg','image/png','image/jpg']

  has_and_belongs_to_many :teams
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :events

  #A user may have many blogs
  #belongs_to_many :blogs

  extend FriendlyId
  friendly_id :username, use: :slugged

end
