class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index]
  
  # GET /users
  # GET /users.json
  def index
      @users = User.all
  end

  # GET /users/1
  #FriendlyID /people/firstname
  def show
    #This is the users profile page
    @user = User.friendly.find(params[:id])


    #Needed to authorize CanCan
    authorize! :show, @user
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    #If users is the first user in the DB, they are admin
    if User.first == nil
      @user.role = "admin"
    elsif @user.role == nil
      @user.role = "user"
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'Your account has been created!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.role == "user"
      @user.role = "member"
      #@user.password = current_user.password
      #@user.password_confirmation = current_user.password_confirmation
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    def require_admin
      if current_user.role != "admin"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role, :bio, :dob, :firstname, :lastname, :major, :minor, :subscription, :cvlink, :resumelink, :mysitelink, :graduation, :username, :email, :password, :password_confirmation, :image, :team_ids => [], :project_ids => [], :event_ids => [], :bloggable_ids => [])
    end
end