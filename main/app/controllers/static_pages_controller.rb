class StaticPagesController < ApplicationController
	def index
		#This is where our home page goes
		@teams = Team.all
	end

	def show
		#This is where our about page goes
	end

	def under_construction
		#This is for the underconstruction page
	end

	def partners
	end
end
