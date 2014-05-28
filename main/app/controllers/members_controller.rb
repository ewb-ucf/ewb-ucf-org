class MembersController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@member = Member.new
  end

  def new_international
  end

  def new_local
  end

  def new_exec_board
  end

  def new_software
  end

  def create
  	@member = Member.new(params[:member])

  	if @member.save
  		flash[:status] = TRUE
  		flash[:alert] = "Thank you! Your application has been submitted for review!"
  	else
  		flash[:status] = FALSE
  		flash[:alert] = @member.errors.full_messages
  	end

  	redirect_to register_path
  end

  # Static Exec Board Page
  def exec_board
  end

  def intl_project_team
    #Member.find_by_username(params[:id])
  end

  def local_project_team
  end

  def software_team
  end

  def alum
  end

end
