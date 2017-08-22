class MeetsController < ApplicationController

  before_action :require_user, except: []
  before_action :require_editor, only: [:edit, :create, :update]
  before_action :require_admin, only: [:destroy]
  before_action :all_meets, only: [:index, :create, :update, :destroy]
  before_action :set_meets, only: [:edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound do |exception|
    message = "Invalid Meet  #{params[:id]}, not found."
    logger.error message
    redirect_to root_url, notice: message
  end
  respond_to :html, :js


  def new
    @meet = Meet.new
  end

  def new_position
    @position = Position.new
  end

  def create
    @meet = Meet.create(meet_params)
  end

  def create_position
    @position = Position.create(position_params)

    if @position.save
      redirect_to request.referrer
    else
      render 'error'
    end
  end

  def show
    @meet = Meet.find params[:id]
    @athletes = @meet.athletes
    @results = {}
    @athletes.each do |athlete|
      position = Position.find_by(athlete_id: athlete.id, meet_id: @meet.id)
      @results[athlete] = position
    end
    @position = Position.new
  end

  def update
    @meet.update_attributes(meet_params)
    redirect_to request.referrer
  end

  def destroy_position
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to request.referrer
  end

  def destroy
    @meet.destroy
    redirect_to request.referrer
  end


  private


  def all_meets
    @meets = Meet.all
  end

  def set_meets
    @meet = Meet.find(params[:id])
  end

  def meet_params
    params.require(:meet).permit(:title, :location, :date, :description, :note)
  end

  def position_params
    params.require(:position).permit(:placement, :time, :note, :athlete_id, :meet_id, :pr)
  end


end
