class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:create, :new]

  # GET /donations
  # GET /donations.json
  def index
    #Show all donations
    #Admin only
    @donations = Donation.all
  end

  def new
    #Create a new donation
    @donation = Donation.new
    @projects = Project.all
  end

  def create
    @donation = Donation.new(donation_params)

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:amount, :comment, :donorname, :companyname, :project_ids => [])
    end

    def require_admin
      if current_user.role != "admin"
        redirect_to root_path
      end
    end
end