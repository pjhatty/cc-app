class WodsController < ApplicationController

  before_action :require_user, except: []
  before_action :require_editor, only: [:edit, :create, :update]
  before_action :require_admin, only: [:destroy]
  before_action :all_wods, only: [:index, :create, :update, :destroy]
  before_action :set_wods, only: [:edit, :update, :destroy]
  respond_to :html, :js


  def new
    @wod = Wod.new
  end

  def new_score
    @score = Score.new
  end

  def create
    @wod = Wod.create(wod_params)
  end

  def create_score
    @score = Score.create(score_params)

    if @score.save
      redirect_to request.referrer
    else
      render 'error'
    end
  end

  def show
    @wod = Wod.find params[:id]
    @athletes = @wod.athletes
    @results = {}
    @athletes.each do |athlete|
      score = Score.find_by(athlete_id: athlete.id, wod_id: @wod.id)
      @results[athlete] = score
    end
    @score = Score.new
  end

  def update
    @wod.update_attributes(wod_params)
    redirect_to request.referrer
  end

  def destroy_score
    @score = Score.find(params[:id])
    @score.destroy
    redirect_to request.referrer
  end

  def destroy
    @wod.destroy
  end


  private


  def all_wods
    @wods = Wod.all
  end

  def set_wods
    @wod = Wod.find(params[:id])
  end

  def wod_params
    params.require(:wod).permit(:title, :location, :date, :description, :note, :hero)
  end

  def score_params
    params.require(:score).permit(:level, :reps, :rounds, :time, :placement, :pr, :athlete_id, :wod_id)
  end

end
