class Member < ActiveRecord::Base
	require 'digest/md5'

	# This is to change :id to a username
	# def to_param
	# 	username
	# end	

	# has_and_belongs_to_many :teams
	has_many :projects 

	attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :gender, :pid, :aboutme, :skills, :experience, :phone
	before_save :encrypt_password

	validates :first_name,
		:presence => TRUE,
		:length => {
			:minimum => 2,
			:allow_blank => TRUE
		}

	validates :last_name,
		:presence => TRUE,
		:length => {
			:minimum => 2,
			:allow_blank => TRUE
		}

	validates :password,
		:presence => TRUE,
		:length => {
			:minimum => 6,
			:allow_blank => TRUE
		},
		:confirmation => TRUE

	validates :password_confirmation,
		:presence => TRUE
		
	validates :email,
		:presence => TRUE,
		:uniqueness => TRUE

	validates :aboutme,
		:presence => TRUE,
		:uniqueness => TRUE

	validates :skills,
		:presence => TRUE,
		:uniqueness => TRUE

	# Anticipated Graduation

	def encrypt_password
		self.password = Digest::MD5.hexdigest(password)
	end
end

class Role < ActiveRecord::Base
	has_and_belongs_to_many :members
end
