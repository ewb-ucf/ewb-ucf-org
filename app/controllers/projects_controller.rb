class ProjectsController < ApplicationController
	include ProjectsHelper

	#Require authentication for new, create, edit, destroy, update actions
	before_filter :require_login, except: [:index, :show]
	
	def index
		#Make projects accessible
		@projects = Project.all

		#Make teams accessible
		@teams = Team.all

		#Needed to authorize CanCan
    	authorize! :index, @projects
	end

	def show
		#This page shows all the projects of a certain type (local, international, software, etc)
		@project = Project.friendly.find(params[:id])

		#Needed to authorize CanCan
    	authorize! :show, @project
	end

	def new
		#This page allows only privilaged users to create new projects
		@project = Project.new

		#Make teams accessible
		@teams = Team.all
	end

	def create
		@project = Project.new(project_params)
		@project.save

		redirect_to project_path(@project)
	end

	def edit
		@project = Project.friendly.find(params[:id])
	end

	def update
		@project = Project.friendly.find(params[:id])
		@project.update(project_params)

		redirect_to project_path(@project)
	end

	def destroy
    	@project = Project.friendly.find(params[:id])
    	@project.destroy

    	redirect_to projects_path
  	end

end
