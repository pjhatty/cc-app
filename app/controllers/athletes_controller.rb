class AthletesController < ApplicationController
  before_action :require_user, except: []
  before_action :require_editor, only: [:edit, :create, :update]
  before_action :require_admin, only: [:destroy]
  before_action :all_athletes, only: [:index, :create, :update, :destroy]
  before_action :set_athletes, only: [:edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound do |exception|
    message = "Invalid Athlete  #{params[:id]}, not found."
    logger.error message
    redirect_to root_url, notice: message
  end
  respond_to :html, :js


  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.create(athlete_params)

  end

  def show
    @athlete = Athlete.find params[:id]
    @meets = @athlete.meets
    @wods = @athlete.wods
  end

  def update
    @athlete.update_attributes(athlete_params)
    redirect_to request.referrer
  end

  def destroy
    @athlete.destroy
    redirect_to request.referrer
  end

  private


  def all_athletes
    @athletes = Athlete.all
  end

  def set_athletes
    @athlete = Athlete.find(params[:id])
  end

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :grade, :image, :note)
  end
end
